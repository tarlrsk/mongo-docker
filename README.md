# Mongo Docker

This repository provides a set of scripts and instructions to facilitate the process of managing a MongoDB database using Docker.

Before executing the dump script, ensure that you have installed the [MongoDB Database Tools](https://www.mongodb.com/docs/database-tools/installation/installation/).

### Connecting to the Database
Use the following connection string to connect to the MongoDB database:
```
mongodb://root:123456@localhost:27017/?authMechanism=DEFAULT
```

### Running the Docker Container
To start the Docker container, use the following command:
```
docker compose up -d
```

### Stopping the Docker Container
To stop the Docker container, use the following command:
```
docker compose down
```

### Dump the Remote Database to Local MongoDB
To dump the remote database into your local MongoDB, run:
```
./bakery-mongo.sh dump
```

### Only Retrieve the Dump File from the Remote Database
To retrieve only the dump file from the remote database, run:
```
./bakery-mongo.sh backup
```

### Restore the Dump File Locally
To restore the dump file on your local machine into the local MongoDB instance, run:
```
./bakery-mongo.sh restore
```
