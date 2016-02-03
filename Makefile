.PHONY: default test

default:
	@echo 'usage: make <target>'
	@echo
	@echo 'make test'
	@echo 'make vendor_update'
	@echo 'make vagrant_setup'
	@echo '...'

vendor_update:
	@echo 'refreshing conda installer'
	@echo
	mkdir -p vendor
	wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O vendor/miniconda_linux-x86_64.sh

vagrant_reset:
	vagrant destroy --force && vagrant up

vagrant_setup:
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y install language-pack-en
	sudo locale-gen en_GB.UTF-8
	sudo apt-get -y install git
	sudo apt-get -y install libpq-dev
	sudo mkdir /app && chown vagrant:vagrant /app
	sudo mkdir /app/cache && chown vagrant:vagrant /app/cache
	sudo mkdir /app/env && chown vagrant:vagrant /app/env

vagrant_start:
	vagrant up && vagrant ssh

test:
	bash bin/detect /tmp
	bash bin/compile /tmp /app/cache /app/env
	bash bin/release /tmp
