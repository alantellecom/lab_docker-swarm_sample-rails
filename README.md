* projeto + Dockerfile (git)

Se alterar projeto:

docker build -t alanlab/cluster_app:1.0 .

docker login

docker push alanlab/cluster_app:1.0
-------------------------------------------------------

* docker-compose.yml (git)

Se imagem do projeto sofreu upgrade de versão, alterar image do docker-compose com nova versão
---------------------------------------------------------

* docker swarm

Criar nodes a partir de instâncias:

1- Manager primário -> rodar em uma instância: docker swarm init --advertise-addr “ip_da_instância”

2- Adicionar workers em outros nodes com retorno do comando acima

3- Adicionar managers secundários em outras instância -> Com retorno do camando "docker swarm join-token manager" executado a partir de um manager, copiar e executar em outra instância.

Iniciar serviços:

1- clonar git do docker-stack.yml em um node manager

2- rodar neste mesmo node manager: docker stack deploy -c docker-compose.yml labSwarm

3 - esclar com o comando: docker service scale <nome_serviço>=<numero_vezes>  exe: docker service scale myservice_web=3




