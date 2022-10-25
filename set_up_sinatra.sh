#!/bin/zsh

# Simple script to set up Git and RSpec for a Ruby project
# as per instructions on https://github.com/makersacademy/golden-square/blob/main/pills/setting_up_an_rspec_project.md

bundle add sinatra sinatra-contrib webrick rack-test

touch app.rb
echo "require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
end" > app.rb

echo "[+] app.rb created and populated"

touch app.rb

mkdir spec/integration
touch spec/integration/app_spec.rb

touch config.ru

echo "# file: config.ru
require './app'
run Application
" > config.ru

rackup