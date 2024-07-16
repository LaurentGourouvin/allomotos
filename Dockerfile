# Utiliser une image de Node.js comme image de base
FROM node:22-alpine3.19

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le package.json et le package-lock.json
COPY package*.json ./

# Install apt
RUN npm install -g @nestjs/cli@10.1.8

# Installer les dépendances
RUN npm install

# Copier le reste de l'application
COPY . .

# Construire l'application
#RUN npm run build

# Exposer le port de l'application
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "run", "start:dev"]
