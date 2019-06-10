FROM node:alpine as builder
LABEL maintainer="julio@blackdevs.com.br"

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build
# /app/build will be the directory of files

# second phase
FROM nginx
EXPOSE 80

# copying files from previous phase
COPY --from=builder /app/build /usr/share/nginx/html

# build this image
# docker image build --tag juliocesarmidia/todo-vue .

# run this image with a container
# docker container run --name juliocesarmidia/todo-vue -p 80:80 juliocesarmidia/todo-vue
# docker container run -it --name juliocesarmidia/todo-vue -p 80:80 juliocesarmidia/todo-vue bash
