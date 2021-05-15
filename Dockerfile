FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# /app/build > will have the entire frontend build in the container

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html