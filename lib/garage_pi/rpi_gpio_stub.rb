module RPi
  module GPIO
    def self.stub_method(name)
      define_singleton_method(name) do |*args|
        puts "RPi::GPIO##{name} called with #{args.inspect}"
      end
    end
    
    stub_method(:set_numbering)
    stub_method(:setup)
    stub_method(:set_high)
    stub_method(:set_low)
    stub_method(:clean_up)
  end
end
