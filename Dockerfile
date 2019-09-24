FROM node:10

RUN apt-get update && apt-get upgrade -y

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn

COPY . .

CMD ["npm", "start"]
