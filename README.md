# ToDo Project

> This is a ToDo project made with Vue JS
It stores the data in Local Storage
> It has unit tests with jest

[![Build Status](https://badgen.net/travis/julio-cesar-development/todo-vue?icon=travis)](https://travis-ci.com/julio-cesar-development/todo-vue)
[![Netlify Status](https://api.netlify.com/api/v1/badges/35949db2-73aa-4155-b376-e36ad9a163ec/deploy-status)](https://app.netlify.com/sites/todo-vue-tasks/deploys)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=julio-cesar-development_todo-vue&metric=alert_status)](https://sonarcloud.io/dashboard?id=julio-cesar-development_todo-vue)
[![Coverage Status](https://coveralls.io/repos/github/julio-cesar-development/todo-vue/badge.svg?branch=master)](https://coveralls.io/github/julio-cesar-development/todo-vue?branch=master)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/todo-vue)](https://github.com/julio-cesar-development/todo-vue)

See project [ToDo Vue JS](https://todo-vue-tasks.netlify.com)

## Project setup

> Running with docker

```bash
# Build the app image
docker image build --tag todo-vue:latest .
# Run the app image
docker container run --name todo-vue -p 80:80 todo-vue:latest
# Build the test image
docker image build --tag todo-vue-test:latest -f ./test.Dockerfile .
# Run the test image
docker container run --name todo-vue-test todo-vue-test:latest
```

> Running with docker-compose

```bash
# Run app
docker-compose up -d
# Run tests
docker-compose -f docker-compose-tests.yml up
```

> Running with Kubernetes

```bash
chmod +x deploy.sh && . $_
```

> Run workload tests

```bash
# -t threads
# -c connections
# -d timing
docker run --rm -d williamyeh/wrk -t4 -c5000 -d20s -H 'Host: todo-vue.blackdevs.com.br' --timeout 2s http://todo-vue.blackdevs.com.br
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
