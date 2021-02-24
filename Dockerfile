FROM node:alpine AS builder

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build

# now we only care about /app/build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html