require 'garage_pi/image_proxy'
require 'garage_pi/door_opener_app'

use Rack::Static, :urls => { "/" => "index.html", "/css/index.css" => "/css/index.css" } , :root => "public", :index => "index.html"

map("/capture_image") { run(GaragePi::ImageProxy.new) }

map("/toggle") { run(GaragePi::DoorOpenerApp.new) }
