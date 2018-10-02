# base image
FROM node:10.11.0

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# copy src to workdir
COPY /src /usr/src/app/src

# copy public folder to workdir
COPY /public /usr/src/app/public

# install and cache app dependencies
COPY package-lock.json /usr/src/app/package-lock.json
COPY package.json /usr/src/app/package.json
RUN npm install

# start app
CMD ["npm", "start"]
