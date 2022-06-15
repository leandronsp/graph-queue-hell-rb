require 'rack'
require 'adelnor'
require 'chespirito'
require './app/app_schema'

class GraphQLController < Chespirito::Controller
  def create
    query          = request.params['query']
    variables      = request.params['variables']
    operation_name = request.params['operationName']
    result         = AppSchema.execute(query,
                                       variables: variables,
                                       context: {},
                                       operation_name: operation_name)

    response.status   = 200
    response.headers  = { 'Content-Type' => 'application/json' }
    response.body     = result.to_json
  end
end

app =
  Chespirito::App.configure do |app|
    app.register_route('POST', '/graphql', [GraphQLController, :create])
  end

Adelnor::Server.run app, 3000
