# sts-buildpack-conda

A custom Heroku [buildpack](https://devcenter.heroku.com/articles/buildpacks) for Python that uses [conda](http://conda.pydata.org/) by [Continuum Analytics](https://www.continuum.io/).

To use it, all you need are the following files in the root directory of your project's git repository:

- `setup.py` - this should use setuptools and provide package details
- `environment.yml` - this is a YAML file that conda uses to define your dependencies

This project uses `make` for maintenance and testing.

## Updating conda installer

To update the cached version of conda, run:

`make vendor_update`

## Testing

For testing changes to this buildpack we recommend using [Vagrant](https://www.vagrantup.com/) with the `Vagrantfile` provided.

To build and run your vagrant box, run:

`make vagrant_start`

Inside the Linux virtual host, run:

`cd /vagrant && make test`

That's all folks. Enjoy!
