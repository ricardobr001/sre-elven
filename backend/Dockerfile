FROM node:10.24.1-slim

ARG BUILD_NODE_ENV
ENV NODE_ENV=${BUILD_NODE_ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build

EXPOSE 3333
ENTRYPOINT ["yarn", "start:prod"]
# trigger deploy
