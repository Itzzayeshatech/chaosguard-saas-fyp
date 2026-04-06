FROM node:25-alpine
WORKDIR /app
COPY package.json .
RUN npm install --production --no-optional
COPY . .
EXPOSE 5000
USER node
CMD ["node", "server.js"]