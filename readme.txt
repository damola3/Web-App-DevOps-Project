Containerisation:


DockerFile
FROM - python 3.8-slim as parent image

WORKDIR - /app as container working directory

RUN - Installed system dependencies, OBDC driver & installed python package requirements.txt for the app

EXPOSE 5000 (port)

CMD - Run app.py on startup


Build Process
docker build -t pipeapp:1.0


Running Container
docker run -it -p 5000:5000 pipeapp:1.0


Tagging Container
docker tag 85d59c651687 daamola3/pipeapp:1.0


Pushing Container
docker push daamola3/pipeapp:1.0
