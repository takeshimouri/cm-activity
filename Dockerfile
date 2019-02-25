FROM node:10-alpine

COPY . /app/
WORKDIR /app

COPY wait.sh /wait.sh

RUN apk add --no-cache mysql-client

ENV PATH /app/node_modules/.bin:$PATH
RUN npm install

# CMD ["npm", "start"]

EXPOSE 3001