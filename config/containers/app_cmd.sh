#!/usr/bin/env bash

# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
exec unicorn -c config/containers/unicorn.rb -E $RAILS_ENV;