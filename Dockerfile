# use an existing docker image as base
FROM node:alpine as builder
WORKDIR /usr/app

# Downlaod and install dependency
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html
