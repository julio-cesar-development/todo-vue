# ToDo Project

> This is a ToDo project made with Vue JS
It stores the data in Local Storage
> It has unit tests with jest

[![Build Status](https://badgen.net/travis/julio-cesar-development/todo-vue?icon=travis)](https://travis-ci.org/julio-cesar-development/todo-vue)
[![Netlify Status](https://api.netlify.com/api/v1/badges/35949db2-73aa-4155-b376-e36ad9a163ec/deploy-status)](https://app.netlify.com/sites/todo-vue-tasks/deploys)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=julio-cesar-development_todo-vue&metric=alert_status)](https://sonarcloud.io/dashboard?id=julio-cesar-development_todo-vue)
[![Coverage Status](https://coveralls.io/repos/github/julio-cesar-development/todo-vue/badge.svg?branch=master)](https://coveralls.io/github/julio-cesar-development/todo-vue?branch=master)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/todo-vue)](https://github.com/julio-cesar-development/todo-vue)

See project [ToDo Vue JS](https://todo-vue-tasks.netlify.com)

## Project setup

> Running with docker

```bash
# Build the app image
docker image build --tag todo-vue .
# Run the app image
docker container run --name todo-vue -p 80:80 todo-vue
# Build the test image
docker image build --tag todo-vue-test -f ./Dockerfile-test .
# Run the test image
docker container run --name todo-vue-test todo-vue-test
```

> Running with docker-compose

```bash
# Run app
docker-compose up -d app
# Run tests
docker-compose up -d test
```

> Running with Kubernetes only

```bash
kubectl apply -f ./k8s
or
chmod +x deploy.sh && . $_
```

> Running with Terraform and local docker

```bash
cd ./terraform-docker
terraform init
terraform apply --auto-approve
# Or run the script
./terraform-docker/run-terraform.sh
```

> Running with Terraform, Kubernetes and Helm

```bash
cd ./ci
terraform init
terraform apply --auto-approve
```

> Running appart

```bash
# Install dependencies
npm install
# Compiles and hot-reloads for development
npm run serve
# Compiles and minifies for production
npm run build
# Run tests
npm run test
# Run tests in watch mode
npm run test:tdd
# Run lint
npm run lint
```

## Authors

* **Julio Cesar** - *Initial work* - [Blackdevs](https://blackdevs.com.br)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
