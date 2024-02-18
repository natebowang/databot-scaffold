DC_LOCAL := docker compose -f .docker/compose.local.yml
DC_PROD := docker compose -f .docker/compose.prod.yml

# [More colors](https://www.shellhacks.com/bash-colors/)
SPLITTER := ---------------
RED := "\e[31m$(SPLITTER) %s $(SPLITTER)\e[0m\n"
YELLOW := "\e[33m$(SPLITTER) %s $(SPLITTER)\e[0m\n"
CYAN := "\e[36m$(SPLITTER) %s $(SPLITTER)\e[0m\n"

.PHONY: start $(MAKECMDGOALS)

## Local environment
dev:
	@printf $(CYAN) "Starting local databot using test data"
	@$(DC_LOCAL) up -d --build
	@$(DC_LOCAL) exec store bash -c 'python3 src/import_json'
	@#$(DC_LOCAL) exec bot bash -c 'npm start'
	@#$(DC_LOCAL) exec store bash

test:
	@$(DC_LOCAL) exec bot bash -c 'npm test'
	@$(DC_LOCAL) exec store bash -c 'pytest'

testOne:
	@$(DC_LOCAL) exec bot bash -c 'npm test -- main.test.ts'

rmBotLog:
	@rm -rf bot/log/.*audit.json && rm -rf bot/log/bot.json*

rmStoreLog:
	@rm -rf store/log/.*audit.json && rm -rf store/log/bot.json*

## Prod environment
deploy:
	@printf $(YELLOW) "Deploying AWS databot using actual data"
	@$(DC_PROD) up -d --build
	@$(DC_PROD) exec store bash -c 'python3 src/importJson'

start:
	@printf $(CYAN) "Starting AWS databot using actual data"
	@echo "deploy EC2"
	@echo "start EC2"

stop:
	@printf $(YELLOW) "Stopping AWS databot"

tail:

destroy:
	@printf $(RED) "Destroying AWS databot"
