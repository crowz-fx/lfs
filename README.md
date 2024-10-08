# LFS

Linux from scratch seems cool af to roll your own and get a deeper understanding of what actually composes a linux system.

> [!NOTE]
> Built using version `12.2`
> Not finished - currently @ `5.3. GCC-14.2.0 - Pass 1`

Other things to note/read

- [LFS docs at version 12.2](https://www.linuxfromscratch.org/lfs/view/12.2/index.html)
- [Rationale for packages](https://www.linuxfromscratch.org/lfs/view/12.2/prologue/package-choices.html)

## Run

### Barebones base image from debian

Useful to just get the barebones top-of-tree image LFS is built on top of

```bash
make run-empty

# to nuke existing container
make clean=1 run-empty
```

### Base image built to build LFS

This image has all of the `install` tools required to be able to install/compile/configure LFS

```bash
make run-base

# to nuke existing container
make clean=1 run-base
```

### Run the fully built LFS system

This image has all of the `install` tools required to be able to install/compile/configure LFS

```bash
make run

# to nuke existing container
make clean=1 run
```

## Build

### Base

```bash
make build-base

# to add a --no-cache to start from fresh
make cache=0 build-base
```

### Full system

```bash
make build

# to add a --no-cache to start from fresh
make cache=0 build
```

## Cleanup

### Nuke all containers

> [!WARNING]  
> This will nuke the containers specific to LFS (`lfs-base` and `lfs-full`)

```bash
make cleanup
```

### Nuke everything

> [!CAUTION]
> This wipes out everything, volumes, caches, images, containers etc. on your whole `SYSTEM`!

```bash
make nuke
```
