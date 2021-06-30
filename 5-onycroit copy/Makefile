MY_DOCKER_COMPOSE=./srcs/docker-compose.yml

all		:	up

start	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} start

show	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} up --build 

up	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} up  -d --build

stop	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} stop

down	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} down

clean	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} down -v

fclean	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} down -v
	@ docker system prune --all

correclean :
	@ echo "On arrete tous les conteneurs\nOn supprime toutes les image"
	@ echo "On supprime tous les volumes\nOn supprime tous les reseaux"
	@ docker stop $(docker ps -qa) 2>/dev/null
	@ docker rm $(docker ps -qa) 2>/dev/null
	@ docker rmi -f $(docker images -qa) 2>/dev/null
	@ docker volume rm $(docker volume ls -q) 2>/dev/null
	@ docker network rm $(docker ls -q)

ps		:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} ps

webpage	:
	firefox 'https://www.gtaverne.42.fr'

.PHONY	:	all start ps show up down clean fclean webpage