###################
# BUILD FOR LOCAL DEVELOPMENT
###################

FROM node:14-alpine As development

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install --frozen-lockfile

COPY . .

USER node

###################
# BUILD FOR PRODUCTION
###################

FROM node:14-alpine As build

WORKDIR /usr/src/app

COPY package*.json ./

COPY --from=development /usr/src/app/node_modules ./node_modules

COPY . .

RUN yarn build

ENV NODE_ENV production

USER node

###################
# PRODUCTION
###################

FROM node:14-alpine As production

COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/dist ./dist

CMD [ "node", "dist/main.js" ]
