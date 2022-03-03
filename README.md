# graph-queue-hell-rb

This project is a sample Ruby Rack application using GraphQL for learning purpose.

## Development

Setup:
```
make bundle
```

Running the server:
```
make server
```

Perform GraphQL simple query:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "query { testField }"}' \
  http://localhost:3000/graphql
```

Perform GraphQL simple mutation:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "mutation { testField }"}' \
  http://localhost:3000/graphql
```
