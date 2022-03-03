require './app/app_schema'
require 'json'

class Routes
  ROUTES_TABLE = {
    'POST /graphql' => :graphql_route
  }.freeze

  def self.route(*args)
    new(*args).process
  end

  def initialize(*args)
    @verb, @path, @params, @headers, @cookie = args
  end

  def process
    route = ROUTES_TABLE["#{@verb} #{@path}"]

    raise 'Route not found' unless route

    send(route)
  end

  def graphql_route
    query          = @params[:query]
    variables      = @params[:variables]
    operation_name = @params[:operationName]
    result         = AppSchema.execute(query,
                                       variables: variables,
                                       context: {},
                                       operation_name: operation_name)

    {
      status: 200,
      headers: { 'Content-Type' => 'application/json' },
      body: result.to_json
    }
  end
end
