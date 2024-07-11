install:
	./install.sh

docker-start:
	./scripts/docker/docker.sh

docker-stop:
	./scripts/docker/docker-stop.sh

docker-build:
	./scripts/docker/docker-build.sh

docker-restart:
	./scripts/docker/docker-restart.sh

docker-purge:
	./scripts/docker/docker-purge.sh

docker-status:
	./scripts/docker/docker-status.sh