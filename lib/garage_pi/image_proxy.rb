require 'rack/proxy'

module GaragePi
  class ImageProxy < Rack::Proxy
    def rewrite_env(env)
      env["HTTP_HOST"] = "localhost"
      env["REQUEST_PATH"] = "/screenshot/capture/..."      
    end
  end  
end
