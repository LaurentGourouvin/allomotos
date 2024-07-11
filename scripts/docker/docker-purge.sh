echo "Exécution de la purge du docker..."
sudo docker rm adminer_motos
sudo docker rm motos_api
sudo docker rm mysql_motos_db

echo "Suppression des différents volumes..."
sudo docker volume rm moto_data_persist_db

echo "Redémarrage de docker..."
sudo systemctl restart docker
