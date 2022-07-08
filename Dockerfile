FROM node:14.16-alpine as builder
WORKDIR /var/lib/reactjs
COPY . .
RUN npm install && \
    npm run-script build

FROM nginx:mainline
COPY --from=builder /var/lib/reactjs/build /usr/share/nginx/html
EXPOSE 80/tcp
