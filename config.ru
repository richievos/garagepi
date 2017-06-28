require 'garage_pi/authentication_middleware'
require 'garage_pi/door_opener_app'
require 'garage_pi/image_proxy'

use GaragePi::AuthenticationMiddleware, password: ENV["GARAGE_PI_PASSWORD"] || "defaultpass"

use Rack::Static, :urls => { "/" => "index.html",
                             "/css/index.css" => "/css/index.css",
                             "/css/slide-to-submit.css" => "/css/slide-to-submit.css",
                             "/js/slide-to-submit.js" => "/js/slide-to-submit.js",
                             "/js/slider.js" => "/js/slider.js",
                             "/login" => "login.html" },
                  :root => "public",
                  :index => "index.html"

map("/capture_image") { run(GaragePi::ImageProxy.new) }

map("/toggle") { run(GaragePi::DoorOpenerApp.new) }
