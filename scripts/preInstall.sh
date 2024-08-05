#set env vars
#set -o allexport; source .env; set +o allexport;

SALTCORN_SECRET=${SALTCORN_SECRET:-`openssl rand -hex 32`}

cat << EOT >> ./.env

SALTCORN_SECRET=${SALTCORN_SECRET}
EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 58565,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT
