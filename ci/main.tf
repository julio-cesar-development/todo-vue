terraform {
  required_version = "~> 0.12.0"
}

resource "null_resource" "application_deploy" {
  provisioner "local-exec" {
    command = <<EOF
set -e

mkdir -p ./tools

curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz
tar xvf helm-v2.14.3-linux-amd64.tar.gz
mv ./linux-amd64/helm ./tools
rm -Rf ./linux-amd64 helm-v2.14.3-linux-amd64.tar.gz

DATE="$(date +%Y-%m-%d)"

NODE_ENV=$(echo -n $${NODE_ENV} | base64 -d)
echo "NODE_ENV $${NODE_ENV}"

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x ./kubectl && mv kubectl ./tools

echo "Deploying version $${VERSION} at $${DATE}"
kubectl apply -f ../k8s/

rm -Rf ./tools
EOF

    environment = {
      VERSION = "${var.app_version}"
      NODE_ENV = "${var.app_config.NODE_ENV}"
    }
  }
}

# terraform apply -auto-approve
# terraform destroy -auto-approve
