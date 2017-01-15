## Description

A simple web app allowing you to interact with a garage door opener and camera attached to a raspberry pi.

General expectation is you'd boot this app up on a raspberry pi (probably via Docker). That raspberry pi has the pi camera attached to it

## Usage

    # Via docker
    docker-compose run --build dev
    
    # Directly
    gem install bundler
    bundle install --without production # the rpi_gpio gem can't install on a mac
    rackup -I lib config.ru
    
    # Test
    curl localhost:9292/toggle        # trigger a door opener button press
    
    # Currently unimplemented
    curl localhost:9292/capture_image # capture an image from the onboard camera
