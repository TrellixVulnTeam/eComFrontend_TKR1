# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
# COPY --from=node /app/dist/eswift-mdb4-angular-pro /usr/share/nginx/html
COPY --from=node /app/dist/todo-mdb4-angular-pro /usr/share/nginx/html

