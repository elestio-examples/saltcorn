#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 60s;

docker-compose exec -T saltcorn-app bash -c "saltcorn create-user -a -e ${ADMIN_EMAIL} -p ${ADMIN_PASSWORD}"