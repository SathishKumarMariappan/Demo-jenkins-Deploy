# Stage 1
FROM node:20.10.0 as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2
FROM nginx:alpine
COPY --from=node /Demo-jenkins-Deploy/dist/demo-app/browser /usr/share/nginx/html



# docker build -t satzm/emptyangular:Versio_1.0 .

# docker login

# docker push satzm/demo:V1
#docker push satzm/emptyangular:tagname



# docker pull satzm/emptyangular
# docker run atzm/emptyangular
