FROM node:alpine as builder
LABEL maintainer="julio@blackdevs.com.br"

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

FROM nginx
USER nginx
EXPOSE 80
COPY --from=builder --chown=nginx:nginx /app/dist /usr/share/nginx/html
