#!/bin/bash
source config-bakery

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Invalid action. Use 'dump' or 'backup' or 'restore'"
    echo  "Ex. './bakery-mongo.sh dump'"
    exit 1
fi

# Check the action provided as the first argument
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
