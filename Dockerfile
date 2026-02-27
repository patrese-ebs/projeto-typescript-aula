#builder
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npx tsc

EXPOSE 6060

CMD ["node", "dist/server.js"]

#production
FROM node:22-alpine AS production

WORKDIR /app


COPY package*.json ./


RUN npm install --only=production


COPY --from=builder /app/dist ./dist


EXPOSE 6060


ENV NODE_ENV=production


CMD ["node", "dist/server.js"]







