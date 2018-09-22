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

## Reporting metrics to push gateway

```sh
  echo "some_metric 3.14" | curl --data-binary @- http://pushgateway.example.org:9091/metrics/job/some_job
```

for local test that would be 

```sh
  echo "some_metric 3.14" | curl --data-binary @- http://localhost:9091/metrics/job/some_job
```


## Observation of the flow

http://localhost:8880/dashboard/




## Perversions

If , for _some_ reason your prometheus server is not in one network with monitored sites (which generally is NOT recommended), there are still hakish way to accomplish polling.
In order to do so, you need push gateway on prometheus site, and series of regular cron jobs, kind of 

```sh
curl -s http://localhost:9100/metrics | curl --data-binary @- http://pushgateway.example.org:9091/metrics/job/some_job/instance/some_instance
```

P.S.

Thirdparty ideas used:

-  https://github.com/nopp/grafana_alpine , - slightly refactored + fixed moved key

-  https://github.com/m3db/m3 - m3 family Dockerfiles

-  https://github.com/napnap75/rpi-prometheus  - openhabian/rpi slave images

-  https://github.com/KuguHome/openhab-prometheus-metrics - prometheus compatible metrics from openhabian

Temporary:

- https://hub.docker.com/r/jcollie/openhab-exporter/


Further idea:

https://github.com/robustperception/pushprox
