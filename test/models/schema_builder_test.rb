require 'test_helper'

class SchemaBuilderTest < ActiveSupport::TestCase
  setup do
    @fake_definition = "
      type Query {
        someString: String
        anotherField: AnObject
      }
      type AnObject {
        number: Int
        anotherObject: AnOtherObject
      }
      type AnOtherObject {
        text: String
      }
    "
  end

  test ".build_from_definition creates a Schema object from a definition string" do
    result = SchemaBuilder.build_from_definition(
      @fake_definition
    )

    assert_not_nil result.types['Query']
    assert_not_nil result.types['Query'].fields['someString']
    assert_equal GraphQL::STRING_TYPE, result.types['Query'].fields['someString'].type
  end

  test ".build_from_definition creates fake resolvers for all fields" do
    schema = SchemaBuilder.build_from_definition(
      @fake_definition
    )

    result = schema.execute('{ someString anotherField { number } }')

    assert_not_nil result['data']
    assert result['data']['someString'].is_a?(String)
    assert result['data']['anotherField']['number'].is_a?(Integer)
  end
end
