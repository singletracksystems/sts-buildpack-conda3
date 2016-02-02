.PHONY: default

default:
	@echo 'usage: make <target>'
	@echo
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

vagrant start:
	vagrant up && vagrant ssh
