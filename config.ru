require 'garage_pi/authentication_middleware'
require 'garage_pi/door_opener_app'
require 'garage_pi/image_proxy'

use GaragePi::AuthenticationMiddleware, password: ENV["password"] || "defaultpass"

use Rack::Static, :urls => { "/" => "index.html",
                             "/css/index.css" => "/css/index.css",
                             "/login" => "login.html" },
                  :root => "public",
                  :index => "index.html"

map("/capture_image") { run(GaragePi::ImageProxy.new) }

map("/toggle") { run(GaragePi::DoorOpenerApp.new) }
