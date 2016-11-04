module Fake
  module Strategies
    class String
      class << self
        def generate(_field)
          Faker::Lorem.sentence
        end
      end
    end
  end
end
