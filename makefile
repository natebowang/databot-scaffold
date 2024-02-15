DC_LOCAL := docker compose -f .docker/compose.local.yml
DC_PROD := docker compose -f .docker/compose.prod.yml
START_LOGROTATE := script/logrotate.sh
START_BOT := npm start
TAIL_LOG := sleep 3 && tail -f $$LOG_FILE_PATH_FROM_BOT | pino-pretty

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
	@$(DC_LOCAL) exec bot bash -c '$(START_LOGROTATE) & $(START_BOT) & $(TAIL_LOG)'

test:
	@npm test --prefix ./bot/

testOne:
	@npm test --prefix ./bot/ -- main.test.ts

## Prod environment
deploy:
	@printf $(YELLOW) "Deploying AWS databot using actual data"
	@$(DC_PROD) up -d --build

start:
	@printf $(CYAN) "Starting AWS databot using actual data"
	@echo "deploy EC2"
	@echo "start EC2"

stop:
	@printf $(YELLOW) "Stopping AWS databot"

tail:

destroy:
	@printf $(RED) "Destroying AWS databot"
