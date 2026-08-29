#!/usr/bin/env bash
set -e

JOIN_FILE="/vagrant/swarm-join.sh"

echo "==> Aguardando comando para ingresso no Swarm..."

for attempt in $(seq 1 60); do
  if [ -s "${JOIN_FILE}" ]; then
    break
  fi
  sleep 2
done

if [ ! -s "${JOIN_FILE}" ]; then
  echo "ERRO: arquivo ${JOIN_FILE} não foi criado pelo manager."
  exit 1
fi

STATE="$(docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || true)"

if [ "${STATE}" != "active" ]; then
  bash "${JOIN_FILE}"
else
  echo "==> Este nó já pertence a um cluster Swarm."
fi
