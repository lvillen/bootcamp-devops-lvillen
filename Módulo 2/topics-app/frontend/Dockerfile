FROM node:24-alpine3.21

WORKDIR /usr/src/app

RUN apk add --no-cache curl

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
