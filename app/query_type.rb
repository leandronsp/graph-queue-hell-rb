require 'graphql'

class QueryType < GraphQL::Schema::Object
  field :test_field, String

  def test_field
    "Hello World Query!"
  end
end
