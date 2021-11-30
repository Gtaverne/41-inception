MY_DOCKER_COMPOSE=./srcs/docker-compose.yml

all		:	help

start	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} start

show	:
	@ docker-compose -f ${MY_DOCKER_COMPOSE} --env-file ./srcs/.env up --build

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

help	:
	@ echo "List of possible commands"
	@ echo "start:		starts the docker compose"
	@ echo "show:		docker compose up + build"
	@ echo "up:		docker compose up -d --build"
	@ echo "stop:		docker composestop"
	@ echo "down:		docker compose down"
	@ echo "clean:		docker compose down -v, unmounts the volumes"
	@ echo "fclean: 	clean + removes ALL images and containers"
	@ echo "correclean:	launches all the cleaning instructions from the correction"
	@ echo "ps:		docker compose ps, displays all launched services"
	@ echo "webpage:	launches the site in firefox"


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
	nohup firefox 'https://www.gtaverne.42.fr' >>hell.txt &
	
.PHONY	:	all start ps show up down clean fclean webpage help