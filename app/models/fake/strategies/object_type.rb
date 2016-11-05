require 'ostruct'

# Might never be needed since we generate
# fake data for all leaves
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
