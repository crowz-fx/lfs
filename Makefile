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

run-lfs:
	@echo Running lfs container...

ifdef clean
	@echo Removing lfs container...
	docker rm -f lfs
endif

	docker run -it -v $$(pwd)/lfs:/mnt/lfs --name lfs lfs/base

build-base:
	@echo Building lfs base image...

ifeq ($(cache), 0)
	@echo Not using cache...
	docker buildx build --no-cache -t lfs/base -f Dockerfile_base .
else
	docker buildx build -t lfs/base -f Dockerfile_base .
endif

cleanup:
	@echo Nuking all containers...
	@docker rm -f $$(docker ps -aq)
	
nuke:
	@echo Nuking all contianers, images, caches and volumes, it will sleep for 20secs to save you...
	@echo crtl+c quickly if you don't want to do this!
	sleep 20
	@docker system prune --volumes
