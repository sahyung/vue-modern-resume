# build stage
FROM node:stretch-slim as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# CMD ["npm", "run", "serve"]
# EXPOSE 8080
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
