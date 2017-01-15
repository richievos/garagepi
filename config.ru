require 'garage_pi/image_proxy'
require 'garage_pi/door_opener_app'

run(Rack::Builder.new do
  map("/capture_image") { run(GaragePi::ImageProxy.new) }

  map("/toggle") { run(GaragePi::DoorOpenerApp.new) }
end)
