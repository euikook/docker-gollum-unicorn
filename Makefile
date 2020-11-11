

gollum:
	docker run -it --name gollum -v $(shell pwd):/apps -p 80:80 gollum-unicorn

webroot:
	docker run --name webroot -p 80:80 --rm -v $(shell pwd)/conf/nginx/certbot.conf:/etc/nginx/conf.d/default.conf nginx

nginx: 
	docker run --name nginx -p 80:80 -p 443:443 --rm -v $(shell pwd)/conf/nginx/certbot.conf:/etc/nginx/conf.d/default.conf nginx

certbot:
	docker run -it --rm --name certbot \
		-v "$(shell pwd)/conf/certbot:/etc/letsencrypt" \
		-v "$(shell pwd)/var/certbot:/var/lib/letsencrypt" \
		certbot/certbot certonly
