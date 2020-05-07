#############
### build ###
#############

# base image
FROM node:12.2.0 as build

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
WORKDIR /personal-website-frontend

# add `/app/node_modules/.bin` to $PATH
ENV PATH /personal-website-frontend/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /personal-website-frontend/package.json
RUN npm install
RUN npm install -g @angular/cli@8.2.0

# add app
COPY . /personal-website-frontend

# generate build
RUN ng build --output-path=dist

############
### prod ###
############

# base image
FROM nginx:1.16.0-alpine

RUN mkdir -p /var/www/briantambara.tk/public_html/
RUN mkdir -p /var/www/briantambara.tk/logs/

# copy artifact build from the 'build environment'
COPY --from=build /personal-website-frontend/dist /var/www/briantambara.tk/public_html/
COPY --from=build /personal-website-frontend/ngnix /etc/nginx/sites-available/briantambara.tk

RUN ln -s /etc/nginx/sites-available/briantambara.tk /etc/nginx/sites-enabled/briantambara.tk

# expose port 80
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]
