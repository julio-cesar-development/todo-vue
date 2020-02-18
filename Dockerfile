FROM node:10-alpine as builder
LABEL maintainer="julio@blackdevs.com.br"

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

FROM nginx:1.15 as runtime
EXPOSE 80
COPY --from=builder --chown=nginx:nginx /app/dist /usr/share/nginx/html

# docker image build --no-cache --tag juliocesarmidia/todo-vue -f Dockerfile .
# docker image build --tag juliocesarmidia/todo-vue -f Dockerfile .

# docker container run --rm -v $PWD:/app/ juliocesarmidia/todo-vue
# docker container run --rm -v $PWD:/app/ -it --entrypoint "" juliocesarmidia/todo-vue sh
