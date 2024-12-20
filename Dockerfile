
FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

# Démarrer l'application
CMD ["node", "app.js"]
