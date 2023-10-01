FROM node:20.5.1-alpine3.18 AS server_base
# Update NPM
RUN npm install -g npm
WORKDIR /usr/src/app
# Cleanup node_modules if it exists
RUN rm -rf node_modules
COPY package.json .
COPY package-lock.json .


FROM server_base as server_dev
RUN npm install
CMD ["npm", "run", "dev"]


FROM server_base as server_prod
RUN npm install --production
COPY . .
RUN npm run build
