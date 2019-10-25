FROM node:10-alpine
LABEL maintainer="julio@blackdevs.com.br"

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app

CMD ["npm", "run", "test:unit"]
