// MongoDB initialization script

db = db.getSiblingDB('TopicstoreDB');

db.Topics.insertMany([
  {
    "_id": ObjectId("5fa2ca6abe7a379ec4234883"),
    "Name": "Contenedores"
  }
]);
