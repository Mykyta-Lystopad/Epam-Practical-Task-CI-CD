FROM node:alpine
WORKDIR /app
COPY . .
EXPOSE 3000 3001
CMD ["npm", "start"]

# FROM node:7.8.0
# WORKDIR /opt
# ADD . /opt
# RUN npm install
# ENTRYPOINT npm run start
