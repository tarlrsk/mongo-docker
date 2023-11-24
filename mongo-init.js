db = db.getSiblingDB('giant-bakery');
db.createCollection('customer');

// db = db.getSiblingDB('admin');
// db.createUser({
//     user: "root",
//     pwd: "123456",
//     roles: [
//         { role: "root", db: "admin" },
//         { role: "readWrite", db: "giant-bakery" }
//     ]
// });
