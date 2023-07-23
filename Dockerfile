# Start the image with alpine 3.13
FROM alpine:3.13

# Getting nginx end Tsl (openssl for it)
RUN apk update; apk add nginx; apk add openssl

# We need SSL key generation
RUN mkdir /etc/nginx/ssl;
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/C=TR/ST=Istanbul/L=Istanbul/O=42_Kocaeli/OU=mkardes/CN=mkardes/"

# Creating runfolder for nginx
RUN mkdir /run/nginx

# Copy the app package and package-lock.json file
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


## Start the nginx when the app is started
ENTRYPOINT [ "nginx" ]