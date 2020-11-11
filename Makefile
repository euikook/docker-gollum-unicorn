TOP_DIR=$(PWD)

gollum-unicorn:
	docker run -it --rm --name gollum -v $(TOP_DIR):/apps -p 80:80 euikook/gollum-unicorn

gollum-unicorn.build:
	docker build -t euikook/gollum-unicorn .

webroot:
	docker run --rm --name webroot -p 80:80 -v $(TOP)/var/www/webroot:/var/www/webroot -v $(TOP_DIR)/conf/nginx/certbot.conf:/etc/nginx/conf.d/default.conf nginx

nginx: 
	docker run --rm --name nginx -p 80:80 -p 443:443 -v $(TOPD_DIR)/conf/nginx/certbot.conf:/etc/nginx/conf.d/default.conf nginx

certbot:
	docker run -it --rm --name certbot \
		-v "$(TOP_DIR)/conf/certbot:/etc/letsencrypt" \
		-v "$(TOP_DIR)/var/certbot:/var/lib/letsencrypt" \
		certbot/certbot certonly
