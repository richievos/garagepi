require 'garage_pi/door_opener'
require 'json'

module GaragePi
  class DoorOpenerApp
    def call(env)
      GaragePi::DoorOpener.new.press_button

      [ '200', { 'Content-Type' => 'application/json' }, ['']]
    end
  end
end

