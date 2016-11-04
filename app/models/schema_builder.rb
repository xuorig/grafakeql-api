class SchemaBuilder
  class << self
    def build_from_definition(schema_string)
      new(schema_string).build
    end
  end

  def initialize(schema_string)
    @schema_string = schema_string
  end

  def build
    schema = GraphQL::Schema.from_definition(schema_string)
    Fake::Visitor.add_fake_resolvers!(schema)
    schema
  end

  private

  attr_reader(:schema_string)
end
