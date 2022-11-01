FROM node
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY "app.js" .

CMD [ "node", "app.js" ]