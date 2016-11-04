module Fake
  module Strategies
    class Int
      class << self
        def generate(_field)
          Faker::Number.number(4).to_i
        end
      end
    end
  end
end
