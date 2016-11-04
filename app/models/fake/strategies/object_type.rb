require 'ostruct'

module Fake
  module Strategies
    class ObjectType
      class << self
        def generate(field)
          OpenStruct.new
        end
      end
    end
  end
end
