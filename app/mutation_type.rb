require 'graphql'

class MutationType < GraphQL::Schema::Object
  field :test_field, String

  def test_field
    "Hello World Mutation!"
  end
end
