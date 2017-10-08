begin
  require 'rpi_gpio'
rescue LoadError, RuntimeError => e
  puts "Using stub RPi::GPIO"
  require 'garage_pi/rpi_gpio_stub'
end

module GaragePi
  class DoorOpener
    DEFAULT_OUTPUT_PIN = 11
    DEFAULT_BUTTON_HOLD_TIME = 0.5 # seconds

    def initialize(output_pin=DEFAULT_OUTPUT_PIN)
      @output_pin = output_pin
    end

    def press_button(button_hold_time=DEFAULT_BUTTON_HOLD_TIME)
      #####################
      # Setup
      # Pin diagram
      # http://www.raspberrypi-spy.co.uk/2012/06/simple-guide-to-the-rpi-gpio-header-and-pins/
      RPi::GPIO.set_numbering :board
      RPi::GPIO.setup @output_pin, :as => :output, :initialize => :high

      #####################
      # Synthetic button press
      RPi::GPIO.set_low @output_pin
      sleep(button_hold_time)
      RPi::GPIO.set_high @output_pin
    ensure
      #####################
      # Cleanup
      RPi::GPIO.clean_up @output_pin
    end
  end
end
