FROM node

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY "app.js" .

CMD [ "node", "app.js" ]