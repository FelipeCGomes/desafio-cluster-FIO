#!/usr/bin/env bash
set -e

MASTER_IP="10.10.10.100"
JOIN_FILE="/vagrant/swarm-join.sh"

echo "==> Configurando o nó manager..."

if ! docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null | grep -q '^active$'; then
  docker swarm init --advertise-addr="${MASTER_IP}"
fi

TOKEN="$(docker swarm join-token -q worker)"

cat > "${JOIN_FILE}" <<EOF
#!/usr/bin/env bash
docker swarm join --token ${TOKEN} ${MASTER_IP}:2377
EOF

chmod +x "${JOIN_FILE}"

echo "==> Manager configurado."
echo "==> Comando de ingresso dos workers gerado em ${JOIN_FILE}"
