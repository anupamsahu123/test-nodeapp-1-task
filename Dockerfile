FROM node:12.2.0-alpine
COPY . .
RUN npm install
RUN npm build
RUN CI=true
CMD ["npm", "start"]
EXPOSE 8080
