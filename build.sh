set -e
set -v

DDAGENT_IMAGE=dd-agent-ecs
APP=dd-agent-ecs

docker build -t $DDAGENT_IMAGE .

docker tag -f $DDAGENT_IMAGE dkastner/$APP:latest
docker push dkastner/$APP:latest

if [ -z "$TAG" ]; then
  echo "NO TAG SET"
  exit 1
fi

docker tag -f $DDAGENT_IMAGE dkastner/$APP:$TAG
docker push dkastner/$APP:$TAG
