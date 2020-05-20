FROM node:10-alpine as builder
LABEL maintainer="julio@blackdevs.com.br"

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app

EXPOSE 8080

CMD ["npm", "run", "dev"]

# docker image build --no-cache --tag juliocesarmidia/todo-vue-dev -f Dockerfile-dev .
# docker image build --tag juliocesarmidia/todo-vue-dev -f Dockerfile-dev .

# docker container run --rm -v $PWD:/app/ juliocesarmidia/todo-vue-dev
# docker container run --rm -v $PWD:/app/ -it --entrypoint "" juliocesarmidia/todo-vue-dev sh
