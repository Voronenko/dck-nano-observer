dck-nano-observer
=================

[![Build Status](https://travis-ci.com/Voronenko/dck-nano-observer.svg?branch=master)](https://travis-ci.com/Voronenko/dck-nano-observer)


## Preparing openhabian box for docker role

```
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install docker-ce

```

```
sudo systemctl enable docker
sudo systemctl start docker
```

```
sudo docker run --rm arm32v7/hello-world
```

```
sudo usermod -aG docker $USER
```

```
sudo pip install docker-compose
```


P.S.

Thirdparty ideas used:

-  https://github.com/nopp/grafana_alpine , - slightly refactored + fixed moved key

-  https://github.com/m3db/m3 - m3 family Dockerfiles

-  https://github.com/napnap75/rpi-prometheus  - openhabian/rpi slave images
