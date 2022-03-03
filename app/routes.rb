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

    raise StandardError unless respond_to?(route)

    send(route)
  end

  def graphql_route
    variables = prepare_variables(@params[:variables])
    query = @params[:query]
    operation_name = @params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = AppSchema.execute(query, variables: variables, context: context, operation_name: operation_name)

    {
      status: 200,
      headers: { 'Content-Type' => 'application/json' },
      body: result.to_json
    }
  end

  private

  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end
end
