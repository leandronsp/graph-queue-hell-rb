bash:
	@docker-compose run app bash

bundle:
	@docker-compose run app bundle

server:
	@docker-compose run \
		--service-ports \
		app \
		bash -c "bundle exec ruby server.rb"
