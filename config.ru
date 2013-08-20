# This file is used by Rack-based servers to start the application.

use Rack::RubyProf, :path => '/temp/profile'
require ::File.expand_path('../config/environment',  __FILE__)
run SeguridadJusticia::Application

