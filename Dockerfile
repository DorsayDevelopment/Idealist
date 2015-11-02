FROM node:onbuild

WORKDIR /src
ADD . /src

RUN npm install -g gulp
RUN npm install --only=dev
RUN gulp build-prod

WORKDIR /src/dist

RUN npm install --only=prod

EXPOSE 80
CMD ["node", "server.js"]
