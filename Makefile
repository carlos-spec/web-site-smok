
SHELL=/bin/bash

PHONY: serve build

serve:
	cd site/ && hugo serve 

build:
	rm -rf public && cd site/ && hugo && mv public/ .. && cd ..

cdk: build
	rm -rf cdk/site-contents && mv public/ cdk/site-contents && cdk deploy -c domain=smok.media -c subdomain=www
