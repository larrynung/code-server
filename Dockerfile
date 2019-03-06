FROM node:8

# Ensure latest yarn.
RUN npm install -g yarn

# Install VS Code's deps.
RUN apt-get update
RUN apt-get install -y libxkbfile-dev pkg-config libsecret-1-dev libxss1 dbus xvfb libgtk-3-0 git

WORKDIR /app
COPY . .
RUN yarn
RUN yarn task build:server:binary
