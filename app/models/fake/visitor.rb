module Fake
  class Visitor
    class << self
      def add_fake_resolvers!(schema)
        new(schema).add_fake_resolvers!
      end
    end

    def initialize(schema)
      @schema = schema
    end

    def add_fake_resolvers!
      stack = []

      query_root = schema.query
      stack.concat(query_root.fields.values)

      while stack.present?
        field = stack.pop

        generate_fake_resolve(field)

        if field.type.is_a?(GraphQL::ObjectType)
          stack.concat(field.type.fields.values)
        end
      end
    end

    private

    attr_reader(:schema)

    def get_strategy_for_graphql_type(type)
      # TODO Add all types
      if type.is_a?(GraphQL::ObjectType)
        Fake::Strategies::ObjectType
      elsif type == GraphQL::STRING_TYPE
        Fake::Strategies::String
      elsif type == GraphQL::INT_TYPE
        Fake::Strategies::Int
      end
    end

    def generate_fake_resolve(field)
      strategy = get_strategy_for_graphql_type(field.type)

      field.resolve = lambda do |_, _, _|
        strategy.generate(field)
      end
    end
  end
end
