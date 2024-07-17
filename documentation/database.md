# How to Use the Database

You can interact with the database in two different ways. The first method is using Docker.

## Accessing the Database with Docker

To enter the MySQL container, run the following command:

```shell
docker exec -it mysql_motos_db sh
```
Once inside the container, log in to the database using:

```shell
sh-5.1# mysql -h db -u root -p
```
## Using a Web Browser
The second method to access the database is by using your web browser. Simply navigate to:

http://localhost:8080

