FROM node:16-alpine as development
# Current working directory inside container
WORKDIR /usr/src/app
# Copy package.json and Package-lock.json
COPY package*.json .
# Install dependencies
RUN npm install
# Copy Everything
COPY . .
# Run build
RUN npm run build

# Multi stage docker file
FROM node:16-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json .

RUN npm ci --only-production

COPY --from=development /usr/src/app/dist ./dist

CMD [ "node", "dist/index.js" ]