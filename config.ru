require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/event'

# Controllers
require './app'
require './controllers/event_controller'
require './controllers/admin_controller'

run MH5