# Setup simplificado para criar projeto com Framework Hyperf e PHP Swoole para Ambientes Dockerizados

Olá, pessoal! Eu sou o Madson!

Este repositório foi criado com o propósito de simplificar a criação de projetos com Framework Hyperf e PHP Swoole em um ambiente Dockerizado. A ideia é permitir que você clone este repositório e execute UM COMANDO a partir do Makefile para criar um projeto com Framework Hyperf com Dockerfile personalizado, docker-compose, scripts de inicialização, arquivos .ini para PHP/Swoole/Opcache e outros recursos que facilitarão a execução do projeto localmente e em produção.

## Sobre o Projeto
O objetivo principal deste projeto é fornecer uma estrutura que combina o poder do Hyperf, PHP Swoole com a flexibilidade do Docker. Isso permite uma experiência de desenvolvimento PHP moderna, escalável e otimizada.

## Requisitos
   - Git
   - Docker
   - Docker-compose
   - Makefile
   - Ambiente Linux, Mac ou Windows WSL

### Ajustar ás configurações do Swoole, php.ini e Opcache se necessário
```make
.docker/php/ini/php.ini
.docker/php/ini/opcache.ini
.docker/php/ini/swoole.ini
```
## Como Usar
Você pode criar o projeto Hyperf direto em um únido comando ou rodar PHP Swoole antes de criar o projeto.

### Clonar repositório
```shell
git clone https://github.com/madsonar/setup-create-project-hyperf-framework-php-swoole-digital-codigos.git
```

### Comandos Makefile
- Para criar um novo projeto com Framework Hyperf (Após executar este comando o projeto será criado dentro da pasta '/app', bastar acessar o endereço 'http://localhost:9501/')
```make
make create-project-hyperf
```

- Para buildar após ajustes: 
```make
make up-build
```

- Para parar o Docker Compose: 
```make
make down
```

- Para iniciar o Docker Compose apenas Swoole ou rodar o projeto se existir: 
```make
make up
```

- Para iniciar o Docker Compose apenas Swoole ou rodar o projeto se existir em modo detached: 
```make
make up-d
```

- O comando make cmd permite executar comandos arbitrários dentro do container PHP a partir do host local 
```make
make cmd c="ls -la"
```

## Teste app no endereço no browser
- http://0.0.0.0:9501

## Para adicionar novas funcionalidades, basta criar uma nova rota e os controladores correspondentes.
Routing: app/config/config.php
Controllers: app/app/Controller
OBS: Após ajustes deve recarregar a aplicação

## Contato
- [LinkedIn](https://www.linkedin.com/in/madson-aguiar-rodrigues-5650472b/)
- [YouTube](https://www.youtube.com/@MadsonAguiarRodrigues)

## Conclusão
Este projeto serve como um ponto de partida para explorar o Framework Hyperf PHP e PHP Swoole em um ambiente Dockerizado. Sinta-se à vontade para explorar, contribuir e entre em contato se tiver alguma dúvida ou sugestão!