module Fake
  GRAPHQL_TYPE_STRATEGY = {
    GraphQL::STRING_TYPE => Fake::Strategies::String,
    GraphQL::INT_TYPE => Fake::Strategies::Int,
    GraphQL::ObjectType => Fake::Strategies::ObjectType,
  }
end
