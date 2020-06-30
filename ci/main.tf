resource "local_file" "cluster_kubeconfig" {
  filename          = "${path.root}/${var.kubeconfig}"
  sensitive_content = file("${path.root}/${var.kubeconfig}")
}

resource "null_resource" "application_deploy" {
  provisioner "local-exec" {
    command = <<EOF
# set -e


# download and install kubectl
if [ -z $(which kubectl) ]; then
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
  chmod +x ./kubectl && mv kubectl /usr/local/bin
fi

# download and install helm
if [ -z $(which helm) ]; then
  curl -LO https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz
  tar -zxvf ./helm-v3.2.0-linux-amd64.tar.gz && \
    mv ./linux-amd64/helm /usr/local/bin/helm && \
    rm -rf ./linux-amd64/ && rm -f ./helm-v3.2.0-linux-amd64.tar.gz
fi


# create namespace for application
kubectl create namespace $APP_NAMESPACE 2>/dev/null


# install nginx ingress
kubectl create namespace ingress-nginx 2>/dev/null

INGRESS_INSTALLED=$(helm ls --all -n ingress-nginx 2> /dev/null | grep -ic "deployed")
if [ $INGRESS_INSTALLED -eq 0 ]; then
  # add ingress controller repo and update repos
  helm repo add nginx-stable https://helm.nginx.com/stable
  echo "repo added"
  # install ingress controller
  helm install ingress-nginx \
    -n ingress-nginx \
    --set controller.name="ingress-nginx" \
    --set controller.kind=deployment \
    --set controller.service.name=ingress-nginx \
    nginx-stable/nginx-ingress
  echo "release installed"
fi
# check if ingress controller is up and running
while [ $(kubectl get pods -n ingress-nginx -l app=ingress-nginx | grep -ic "running") -eq 0 ]; do
  echo "waiting for ingress controller pod be running"
  sleep 10
done


# install cert manager
kubectl create namespace cert-manager 2>/dev/null
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true --overwrite

CERT_MANAGER_INSTALLED=$(helm ls --all -n cert-manager 2> /dev/null | grep -ic "deployed")
if [ $CERT_MANAGER_INSTALLED -eq 0 ]; then
  # add cert-manager repo and update repos
  helm repo add jetstack https://charts.jetstack.io
  helm repo update

  helm install cert-manager \
    jetstack/cert-manager \
    --namespace cert-manager \
    --version v0.15.1 \
    --set installCRDs=true \
    --set 'extraArgs={--dns01-recursive-nameservers=8.8.8.8:53\,1.1.1.1:53}'
fi
# check if ingress controller is up and running
while [ $(kubectl get pods -n cert-manager -l app=cert-manager | grep -ic "running") -eq 0 ]; do
  echo "waiting for cert manager pod be running"
  sleep 10
done


# install external DNS
EXTERNAL_DNS_INSTALLED=$(helm ls --all -n $APP_NAMESPACE 2> /dev/null | grep -i "external-dns" | grep -ic "deployed")
if [ $EXTERNAL_DNS_INSTALLED -eq 0 ]; then
  # add external-dns repo and update repos
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo update

  helm install external-dns \
    bitnami/external-dns \
    --namespace $APP_NAMESPACE \
    --set provider=aws \
    --set aws.credentials.accessKey=$AWS_ACCESS_KEY \
    --set aws.credentials.secretKey=$AWS_SECRET_KEY \
    --set aws.region=$AWS_REGION \
    --set aws.zoneType='public'
fi
# check if external DNS is up and running
while [ $(kubectl get pods -n $APP_NAMESPACE -l "app.kubernetes.io/name=external-dns" | grep -ic "running") -eq 0 ]; do
  echo "waiting for external DNS pod be running"
  sleep 10
done


echo "Deploying"
helm template \
  --set todoapp.image.repository=$APP_IMAGE \
  --set todoapp.image.tag=$APP_VERSION \
  --set todoapp.secrets.NODE_ENV=$APP_ENV \
  --set todoapp.replicaCount=$APP_REPLICA_COUNT \
  --set todoapp.namespace=$APP_NAMESPACE \
  --set certIssuer.awsAccessKey=$AWS_ACCESS_KEY \
  --set certIssuer.awsSecretKey=$AWS_SECRET_KEY \
  --set certIssuer.hostedZoneID=$AWS_HOSTED_ZONE \
  ./charts > deploy.yaml


kubectl apply -f deploy.yaml
EOF

    environment = {
      APP_IMAGE         = var.app_image
      APP_VERSION       = var.app_version
      APP_ENV           = var.app_env
      APP_REPLICA_COUNT = var.app_replica_count
      APP_NAMESPACE     = var.app_namespace
      AWS_ACCESS_KEY    = var.aws_access_key
      AWS_SECRET_KEY    = var.aws_secret_key
      AWS_REGION        = var.aws_region
      AWS_HOSTED_ZONE   = var.aws_hosted_zone_id
      KUBECONFIG        = local_file.cluster_kubeconfig.filename
    }
  }
}

# terraform init -backend=true
# terraform validate
# terraform plan
# terraform apply -auto-approve
# terraform destroy -auto-approve
