FROM node:18-alpine

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY "app-no-tracer.js" .

CMD [ "node", "app-no-tracer.js" ]