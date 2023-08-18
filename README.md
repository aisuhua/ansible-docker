# Usage

```sh
docker build -t ansible:latest .
docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/id_rsa --net host ansible:latest /bin/sh
```

## Links

- https://github.com/willhallonline/docker-ansible
