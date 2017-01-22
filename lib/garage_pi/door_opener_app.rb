require 'garage_pi/door_opener'
require 'json'

module GaragePi
  class DoorOpenerApp
    def call(env)
      GaragePi::DoorOpener.new.press_button

      [ 302, { 'Location' => '/?toggled=true' }, ['']]
    end
  end
end
