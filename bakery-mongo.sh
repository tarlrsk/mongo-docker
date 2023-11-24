#!/bin/bash
CONFIG_FILE="config-bakery"

# Check if the config file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Config file '$CONFIG_FILE' not found."
  exit 1
fi

source "$CONFIG_FILE"

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Invalid action. Use 'dump' or 'backup' or 'restore'"
    echo  "Ex. './bakery-mongo.sh dump'"
    exit 1
fi

# Check the action provided as the first argument
echo "Running..."
case "$1" in
"dump")
    # Perform mongodump
    mongodump -d="$DATABASE" "$REMOTE_MONGO_URI"
    mongorestore --username="$LOCAL_USERNAME" --password="$LOCAL_PASSWORD" --drop
    ;;
"backup")
    # Perform mongorestore
    mongodump -d="$DATABASE" "$REMOTE_MONGO_URI"
    ;;
"restore")
    # Perform mongorestore
    mongorestore --username="$LOCAL_USERNAME" --password="$LOCAL_PASSWORD" --drop
    ;;
*)
    echo "Invalid action. Use 'dump' or 'backup' or 'restore'"
    echo  "Ex. './bakery-mongo.sh dump'"
    exit 1
    ;;
esac

exit 0
