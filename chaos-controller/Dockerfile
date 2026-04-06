FROM node:25-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install express
COPY . .
EXPOSE 6000
CMD ["node", "controller.js"]