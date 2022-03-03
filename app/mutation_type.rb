require 'graphql'

class MutationType < GraphQL::Schema::Object
  field :test_field,
    String,
    null: false,
    description: "An example field added by the generator"

  def test_field
    "Hello World Mutation!"
  end
end
