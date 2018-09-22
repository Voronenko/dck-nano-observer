create-proxy-network:
	docker network create proxy

link-traefik-to-proxy-network:
	docker network connect proxy traefik
