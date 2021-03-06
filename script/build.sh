#!/usr/bin/env bash
export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_GC_HEAP_FREE_SLOTS=200000

# test environment
export RAILS_ENV="test"

# makes bash exit immediately if any command fails
set -e

# makes bash print all of the commands before being executed
set -x

# bundle gems
bundle > /dev/null

# execute specs
bundle exec rspec spec/controllers
bundle exec rspec spec/business
bundle exec rspec spec/requests
bundle exec rspec spec/integrations
bundle exec rspec spec/models
