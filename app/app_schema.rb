require 'graphql'
require './app/query_type'
require './app/mutation_type'

class AppSchema < GraphQL::Schema
  mutation MutationType
  query QueryType
end
