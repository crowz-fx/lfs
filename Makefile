all: 
	@echo Select an option!

.PHONY:	all

run-empty:
	@echo Running lfs-empty container...

ifdef clean
	@echo Removing lfs-empty container...
	docker rm -f lfs-empty
endif

	docker run -it --name lfs-empty debian:bookworm

run-base:
	@echo Running lfs base container...

ifdef clean
	@echo Removing lfs container...
	docker rm -f lfs-base
endif

	docker run -it -v $$(pwd)/lfs:/mnt/lfs --name lfs-base lfs/base

run:
	@echo Running lfs container...

ifdef clean
	@echo Removing lfs container...
	docker rm -f lfs
endif

	docker run -it --name lfs-full lfs/full

build-base:
	@echo Building lfs base image...

ifeq ($(cache), 0)
	@echo Not using cache...
	docker buildx build --no-cache -t lfs/base -f Dockerfile_base .
else
	docker buildx build -t lfs/base -f Dockerfile_base .
endif

build:
	@echo Building full lfs image...

ifeq ($(cache), 0)
	@echo Not using cache...
	docker buildx build --no-cache -t lfs/full -f Dockerfile_auto .
else
	docker buildx build -t lfs/full -f Dockerfile_auto .
endif

cleanup:
	@echo Nuking all containers...
	@docker rm -f $$(docker ps -aq)
	
nuke:
	@echo Nuking all contianers, images, caches and volumes, it will sleep for 10secs to save you...
	@echo "  crtl+c quickly if you don't want to do this!"
	@echo "  you will get prompted again to confirm..."
	@sleep 20
	docker system prune --volumes
