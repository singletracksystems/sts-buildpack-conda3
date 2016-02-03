# singletrack-buildpack-python

A custom Heroku buildpack for Python that uses conda by Continuum Analytics.

To use it, all you need is the following files in your project:

- `setup.py` - this should use setuptools and provide package details
- `environment.yml` - this is a YAML file that conda uses to define your dependencies

It makes liberal use of `make` for maintenance and testing.

For testing changes to this buildpack we recommend using `vagrant` and `virtualbox` with
the `Vagrantfile` provided.

## Updating conda installer

To update the cached version of conda, run:

`make vendor_update`

## Testing

To build and run your vagrant box, run:

`make vagrant_start`

Inside the Linux virtual host, run:

`cd /vagrant && make test`

That's all folks. Enjoy!
