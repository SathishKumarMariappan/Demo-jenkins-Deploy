# Stage 1 :: Dependency 
FROM node:20.10.0 as node

# Stage 2 : Copy code to Working dir 
WORKDIR /app
COPY . .

# Stage 3 : Set up APP Dependency
RUN npm install 

# Stage 4 : Build 
RUN npm run build

# Stage 5 : Deploy/Host
FROM nginx:alpine
COPY --from=node /Demo-jenkins-Deploy/dist/demo-app/browser /usr/share/nginx/html



# docker build -t app:initial .

# docker login

# docker push satzm/demo:V1
# docker push satzm/demo-angular:initial



# docker pull satzm/demo-angular
# docker run satzm/demo-angular


# gcloud auth login
# gcloud config set project ncpl-june-24
# gcloud services enable artifactregistry.googleapis.com
# gcloud auth configure-docker northamerica-northeast1-docker.pkg.dev
# docker build -t app:initial .
# docker tag app:initial northamerica-northeast1-docker.pkg.dev/ncpl-june-24/demo/app:initial
# docker push northamerica-northeast1-docker.pkg.dev/ncpl-june-24/demo/app:initial
