#! /bin/sh

CONTAINER_ID=$(docker create aergus/latex bash .github/workflows/build.sh)
docker cp . ${CONTAINER_ID}:.
docker start ${CONTAINER_ID}

while [ "$( docker container inspect -f '{{.State.Running}}' ${CONTAINER_ID} )" == "true" ]; do
  sleep 5
done

docker cp ${CONTAINER_ID}:eda-le-modele-efqm-local-build.pdf .
docker rm ${CONTAINER_ID}
