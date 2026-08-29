#!/usr/bin/env bash
set -e

echo "==> Instalando Docker..."

if ! command -v docker >/dev/null 2>&1; then
  curl -fsSL https://get.docker.com | sh
fi

systemctl enable docker
systemctl start docker
usermod -aG docker vagrant

echo "==> Docker instalado:"
docker --version
