## Exercice 1:

#### Create a lemoncode-challenge network
```bash
docker network create lemoncode-challenge
```

#### Create a volume for data persistance 
```bash
docker volume create lemoncode_challenge_data
```

#### Start a MongoDB instance
```bash
docker run -d \
  --name lemoncode-challenge-mongo \
  --network lemoncode-challenge \
  --volume lemoncode_challenge_data:/data/db \
  --volume "$(pwd)/mongo-init.js":/docker-entrypoint-initdb.d/mongo-init.js \
  mongo:noble
```

#### Checking TopicstoreDB exists
```bash
docker exec -it lemoncode-challenge-mongo mongosh

use TopicstoreDB
db.Topics.find()
```

It should return 
```bash
[
  {
    _id: ObjectId('5fa2ca6abe7a379ec4234883'),
    topicName: 'Contenedores'
  }
]
```

#### Build Backend image from Dockerfile
From the backend directory
```bash
docker build -t backend:node .
```

#### Start a Backend instance
```bash
docker run -d --name topics-api \
  --network lemoncode-challenge \
  -e HOST="0.0.0.0" \
  -e DATABASE_URL="mongodb://lemoncode-challenge-mongo:27017" \
  -e DATABASE_NAME="TopicstoreDB" \
  -p 5010:5000 \
  backend:node
```

#### Build Frontend image from Dockerfile
From the frontend directory
```bash
docker build -t frontend:node .
```

#### Start a Frontend instance
```bash
docker run -d --name topics-frontend \
  --network lemoncode-challenge \
  -e API_URI="http://topics-api:5000/api/topics" \
  -p 8080:3000 \
  frontend:node
```

#### Verification
Confirm you can access http://localhost:8080 and that you see:
![Topics](../images/topics.png)

## Exercice 2:

Create an `.env` file from the `.env.template`. After that, the application is ready to be launched. 

#### Commands guide 
Here there is a list of useful commands to use while working with docker compose and this application.

###### Launch the application
```bash
docker compose up
```

To run in detached mode just add `-d`.

###### Check logs
```bash
docker compose logs -f
```

###### Stop the application
```bash
docker compose stop
```

###### Stop the application and removes containers and networks
```bash
docker compose down
```

###### Stop the application and removes containers and volumes
```bash
docker compose down -v
```

###### Stop the application and full clean up
```bash
docker compose down -v --rmi all
```
