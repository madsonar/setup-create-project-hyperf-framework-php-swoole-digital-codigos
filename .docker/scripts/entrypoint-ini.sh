#!/bin/sh

# Obtém o diretório atual
current_directory=$(pwd)

# Imprime o diretório atual no console
echo "O diretório atual é: $current_directory"


# Verifica se a pasta 'app' em dois diretórios acima está vazia
if [ -z "$(ls -A $current_directory)" ]; then
    # Se estiver vazia, execute o servidor PHP embutido
    echo ">>>ENTROU"
    exec php -S 0.0.0.0:9501
    # php -S 0.0.0.0:9501 > /dev/null 2>&1 &
else
    echo ">>>NAO DEU"
    # Executa composer install para instalar as dependências do PHP
    echo ">>>composer install"
    composer install

    # Caso contrário, execute o comando 'php bin/hyperf.php start'
    echo "bin/hyperf.php start"
    php bin/hyperf.php start
fi
