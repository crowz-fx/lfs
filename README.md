# LFS

## Run
### Barebones base image from debian
```bash
make run-empty

# to nuke existing container
make clean=1 run-empty
```

### Base image built to run LFS
```bash
make run-lfs

# to nuke existing container
make clean=1 run-lfs
```

## Build automated
```bash
make build-base

# to add a --no-cache to start from fresh
make clean=1 build-base
```

## Cleanup
### Nuke all containers - danger!
```bash
make cleanup
```

### Nuke everything - danger!
```bash
make nuke
```

