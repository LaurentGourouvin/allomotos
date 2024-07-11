echo "Exécution de la purge du docker..."
sudo docker system prune -a

echo "Redémarrage de docker..."
sudo systemctl restart docker
