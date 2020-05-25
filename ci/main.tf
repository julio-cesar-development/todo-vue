terraform {
  required_version = "~> 0.12.0"
}

resource "local_file" "cluster_kubeconfig" {
  filename          = "${path.root}/${var.kubeconfig}"
  sensitive_content = file("${path.root}/${var.kubeconfig}")
}

resource "null_resource" "application_deploy" {
  provisioner "local-exec" {
    command = <<EOF
# set -e

mkdir -p ./tools

DATE="$(date +%Y-%m-%d)"

curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz
tar xvf helm-v2.14.3-linux-amd64.tar.gz && mv ./linux-amd64/helm ./tools
rm -Rf ./linux-amd64 helm-v2.14.3-linux-amd64.tar.gz

# NODE_ENV=$(echo -n $${NODE_ENV} | base64 -d)
NODE_ENV=$(echo -n $${NODE_ENV})
echo "NODE_ENV $${NODE_ENV}"

echo "Generating templates"
helm template \
  --set todoapp.secrets.NODE_ENV=$${NODE_ENV} \
  --set todoapp.image.tag=$${VERSION} \
  ./charts > deploy.yaml

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x ./kubectl && mv kubectl ./tools

echo "Deploying at $${DATE}"
./tools/kubectl apply -f deploy.yaml

rm -Rf ./tools
EOF

    environment = {
      VERSION = "${var.app_version}"
      NODE_ENV = "${var.app_config.NODE_ENV}"
      KUBECONFIG = local_file.cluster_kubeconfig.filename
    }
  }
}

# terraform init && terraform plan
# terraform apply -auto-approve
# terraform destroy -auto-approve
