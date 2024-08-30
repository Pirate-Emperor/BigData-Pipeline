.PHONY: up
up:
	@ echo "COMPOSE_PROFILES=trino,kudu,hive,dbt,airflow docker-compose -f docker-compose.yml up --build -d --remove-orphans"
	COMPOSE_PROFILES=trino,kudu,hive,dbt,airflow docker-compose -f docker-compose.yml up --build -d --remove-orphans

.PHONY: down
down:
	@ echo "docker compose -f docker-compose.yml --profile '*' down"
	docker compose -f docker-compose.yml --profile '*' down

.PHONY: delete.all
delete.all:
	@ echo "# docker compose -f docker-compose.yml --profile '*' down"
	docker compose -f docker-compose.yml --profile '*' down -v --rmi all
	@ echo "remove ./mnt/hadoop/*, ./mnt/mysql/*, ./mnt/schematool-check/* ./mnt/airflow/*"
	rm -rf ./mnt/hadoop/* ./mnt/mysql/* ./mnt/schematool-check/* ./mnt/airflow/*