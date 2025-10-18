test:
	go test -timeout 30s ./...

format:
	@go tool executor run -d "Mod tidy" --cmd "go mod tidy"
	@go tool executor run -d "Formating code" --cmd "go tool gofumpt -w ."
	@go tool executor run -d "Line lenght" --cmd "golines --chain-split-dots --ignore-generated --reformat-tags --shorten-comments -m 120 -w ."

lint: format
	@go tool executor run -d "staticcheck" --cmd "go tool staticcheck ./..."
	@go tool executor run -d "golang-ci" --cmd "go tool golangci-lint run"