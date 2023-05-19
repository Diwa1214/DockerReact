# Buid phase

FROM node:18-alpine as ProdBuilder

WORKDIR /usr/app

COPY ./package.json .

RUN npm install 

COPY . .

RUN  npm run build


# Run phase

FROM nginx

COPY --from=ProdBuilder  /usr/app/build /usr/share/nginx/html

