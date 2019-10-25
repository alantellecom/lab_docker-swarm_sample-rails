projeto + Dockerfile
git
-------------------------------------------------------

docker-stack.yml
git

docker build -t alanlab/cluster_app:1.0 .

docker login

docker push alanlab/cluster_app:1.0

criar nodes

rodar em um node:

docker swarm init --advertise-addr “ip_da_instância”


adicionar workers em outros nodes com retorno do comando acima

adicionar manager em outros nodes com retorno do camando: docker swarm join-token manager

clonar git do docker-stack.yml em um node manager

rodar neste mesmo node manager:

docker stack deploy -c docker-stack.yml labSwarm