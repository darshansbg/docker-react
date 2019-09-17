#Build Phase

FROM node:8.16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#RUN phase

FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#No need to specify start nginx command, since it is default command for nginx container
