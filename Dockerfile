# Base image
FROM node:20-alpine AS base
WORKDIR /app

# Only package files first (for better caching)
COPY package*.json ./

RUN npm install

# Dev image
FROM base AS dev
WORKDIR /app
COPY . .

ENV NODE_ENV=development
EXPOSE 3000

CMD ["npm", "run", "dev"]
