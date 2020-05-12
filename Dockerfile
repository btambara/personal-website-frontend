#Step 1
# base image
FROM node:12.2.0 as build-stage

# set working directory
WORKDIR /personal-website-frontend

# add `/app/node_modules/.bin` to $PATH
ENV PATH /personal-website-frontend/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /personal-website-frontend/package.json
COPY /ngnix/briantambara.tk /ngnix/briantambara.tk
RUN npm install

# add app
COPY . /personal-website-frontend

# generate build
RUN ng build --output-path=dist

# base image
FROM nginx:alpine

# copy artifact build from the 'build environment'
COPY --from=build-stage /personal-website-frontend/dist /usr/share/nginx/html/
COPY --from=build-stage ./ngnix/briantambara.tk /etc/nginx/conf.d/default.conf

# expose port 80
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]