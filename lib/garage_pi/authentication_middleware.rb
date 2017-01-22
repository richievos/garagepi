require 'rack/response'
require 'rack/request'
require 'json'

module GaragePi
  class AuthenticationMiddleware
    def initialize(app, config)
      @password = config.fetch(:password)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)

      if req.path != '/login' &&
        req.cookies['password'] != @password

        redirect_to_login
      elsif req.path == '/login' && req.post?
        response = Rack::Response.new
        one_year_from_now = Time.now + 365 * 60 * 60
        response.set_cookie('password', { value: req.params['password'],
                                          path: "/",
                                          expires: one_year_from_now })
        response.redirect "/?post_login=true"
        response.finish
      else
        @app.call(env)
      end
    end

    private
    def redirect_to_login
      [ 302, { 'Location' => '/login' }, ['']]
    end
  end
end
