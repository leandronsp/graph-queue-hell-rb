bash:
	@docker-compose run app bash

bundle:
	@docker-compose run app bundle

server:
	@docker-compose run \
		--service-ports \
		app \
		bash -c "bundle exec ruby server.rb"

graphql.query:
	@curl -X POST \
		-H "Content-Type: application/json" \
		-d '{"query": "query { testField }"}' \
		http://localhost:3000/graphql

graphql.mutation:
	@curl -X POST \
		-H "Content-Type: application/json" \
		-d '{"query": "mutation { testField }"}' \
		http://localhost:3000/graphql

