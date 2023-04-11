FROM node:16.17-alpine3.16 as deps

WORKDIR /app

RUN yarn global add typescript tsc

COPY package.json ./

RUN yarn install --production --frozen-lockfile

COPY . .

RUN yarn build


## this is stage two , where the app actually runs

FROM node:16-alpine as runner

EXPOSE 3000
WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/dist ./dist
COPY --from=deps /app/package.json ./package.json

CMD ["yarn", "start"]