# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require 'jdbc/sqlite3'
Jdbc::SQLite3.load_driver
run Rails.application
