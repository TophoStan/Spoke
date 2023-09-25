FROM node

WORKDIR /app

COPY yarn.lock ./


RUN yarn install

RUN npm install --save-dev cross-env
COPY . . 

EXPOSE 9090

RUN npm i

CMD [ "npm", "run", "run-local-reticulum"]