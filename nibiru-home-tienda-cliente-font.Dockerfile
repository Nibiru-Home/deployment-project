FROM node:22.19.0 AS build
 
RUN apt-get update
RUN apt-get install -y git
 
RUN mkdir /opt/app
WORKDIR /opt/app
RUN git clone https://github.com/Nibiru-Home/tienda-cliente-fronted.git
WORKDIR /opt/app/tienda-cliente-fronted
RUN npm ci
RUN npm run build --prod
 
 
 
FROM nginx:1.28.0-alpine3.21
COPY --from=build /opt/app/tienda-cliente-fronted/dist/tienda-cliente-fronted/browser/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
