# Definindo o 'init-script' para executar o script init-local.sh
USER := $(shell id -un)
UID := $(shell id -u)
GID := $(shell id -g)

init-script:
	@echo "Executando o script start..."
	@sh ./.docker/scripts/init-local.sh

up: init-script
	@echo "Iniciando o Docker Compose..."
	@docker-compose up

down: init-script
	@echo "Parando os contêineres do Docker Compose..."
	@docker-compose down

up-d: init-script
	@echo "Iniciando o Docker Compose em modo detached..."
	@docker-compose up -d

up-build: init-script
	@echo "Construindo as imagens do Docker Compose..."
	@echo "USER_ID: $(UID)"
	@echo "GROUP_ID: $(GID)"
	@echo "USER_NAME: $(USER)"
	@docker rm -f php-swoole-hyperf 2>/dev/null || true
	@docker-compose build --build-arg UID=$(UID) --build-arg GID=$(GID) --build-arg USER=$(USER)
	@docker-compose up -d
	@echo "Docker Compose em modo detached..."

cmd:
	@echo "Executando o comando dentro do container PHP..."
	@docker-compose exec create-project-hyperf $(c)

# Regra para criar um projeto Hyperf: make create-project-hyperf
create-project-hyperf:
	@if [ ! -d "./app" ]; then \
		mkdir app; \
	fi;
	if [ -z "$$(ls -A ./app)" ]; then \
		echo "A pasta 'app' está vazia. Criando um novo projeto Hyperf..."; \
		make up-build; \
		docker-compose exec php-swoole-hyperf composer create-project hyperf/hyperf-skeleton .; \
		make up-build; \
		echo "Projeto criado com sucesso!"; \
	else \
		echo "A pasta 'app' já contém um projeto. Nenhuma ação realizada."; \
	fi;