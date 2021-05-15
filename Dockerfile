FROM node:alpine

WORKDIR /app

COPY package*.json /app

RUN npm install

COPY ./ /app

RUN npm run build

# /app/build > will have the entire frontend build in the container

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html

# Nginx image automatically starts the server so we don't need to