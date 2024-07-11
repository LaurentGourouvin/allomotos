#!/bin/bash

# Fonction pour vérifier si une commande existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Vérification de Docker
if command_exists docker; then
    echo "Docker est déjà installé."
else
    echo "Docker n'est pas installé. Installation de Docker..."

    # Mise à jour de la liste des paquets
    sudo apt-get update

    # Installation des paquets nécessaires pour l'installation de Docker
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Ajout de la clé GPG officielle de Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Ajout du dépôt Docker
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Mise à jour de la liste des paquets avec le nouveau dépôt Docker
    sudo apt-get update

    # Installation de Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    echo "Docker a été installé avec succès."
fi

# Vérification de Docker Compose
if command_exists docker-compose; then
    echo "Docker Compose est déjà installé."
else
    echo "Docker Compose n'est pas installé. Installation de Docker Compose..."

    # Téléchargement de la dernière version de Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Application des permissions d'exécution
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker Compose a été installé avec succès."
fi

# Vérification de l'appartenance à groupe Docker et ajout si nécessaire
if groups $USER | grep -q docker; then
    echo "Votre utilisateur ($USER) appartient déjà au groupe Docker."
else
    echo "Ajout de votre utilisateur ($USER) au groupe Docker..."

    # Ajout de l'utilisateur au groupe Docker
    sudo groupadd docker
    sudo usermod -aG docker $USER

    echo "Utilisateur ajouté au groupe Docker."

    # Redémarrage de la session pour appliquer les changements de groupe
    echo "Redémarrage de la session pour appliquer les changements de groupe..."
    echo "Pour lancer votre docker :  make docker-start"
    exec newgrp docker
fi

