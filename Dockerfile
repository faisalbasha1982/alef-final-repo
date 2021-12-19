FROM node:12

RUN apt update  -y
RUN apt upgrade -y
RUN apt install -y nginx

WORKDIR /app

COPY . /app

RUN npm install

RUN useradd -r -u 1001 -g root nonroot

RUN chown -R nonroot /app

USER nonroot


EXPOSE 5000

# Periodically check if the application is running. If not, shutdown the
# container.
HEALTHCHECK --interval=2m --timeout=5s --start-period=2m \
  CMD nc -z -w5 127.0.0.1 5080 || exit 1

# Wait 5 seconds for the MongoDB connection
CMD echo "Warming up" && sleep 5 && npm start

