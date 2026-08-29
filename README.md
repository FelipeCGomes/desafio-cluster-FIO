# Desafio Cluster Docker Swarm com Vagrant — DIO

Projeto desenvolvido para o desafio da DIO com o objetivo de criar automaticamente um **cluster Docker Swarm local** utilizando **Vagrant** e **VirtualBox**.

## Objetivos do desafio

- Criar 4 máquinas virtuais:
  - `master`
  - `node01`
  - `node02`
  - `node03`
- Definir IP fixo para cada máquina.
- Instalar Docker automaticamente em todas as VMs.
- Inicializar o `master` como **Swarm Manager**.
- Adicionar os demais nós ao cluster como **Workers**.

## Endereçamento

| Máquina | Função | IP |
|---|---|---|
| master | Swarm Manager | 10.10.10.100 |
| node01 | Worker | 10.10.10.101 |
| node02 | Worker | 10.10.10.102 |
| node03 | Worker | 10.10.10.103 |

## Estrutura

```text
.
├── Vagrantfile
├── docker.sh
├── master.sh
├── worker.sh
├── .gitignore
└── README.md
```

## Pré-requisitos

- Vagrant
- VirtualBox

## Subir o ambiente

```bash
vagrant up
```

O provisionamento cria as quatro VMs, instala o Docker, inicializa o Swarm no `master` e adiciona `node01`, `node02` e `node03` automaticamente como Workers.

## Validar o cluster

```bash
vagrant ssh master
docker node ls
```

O resultado deverá apresentar quatro nós, sendo o `master` o manager.

## Teste opcional

```bash
docker service create --name web --publish 8080:80 --replicas 4 nginx
docker service ls
docker service ps web
```

Para remover o serviço:

```bash
docker service rm web
```

## Parar as máquinas

```bash
vagrant halt
```

## Excluir o laboratório

```bash
vagrant destroy -f
```

## Referência

Projeto baseado no desafio da DIO sobre criação de um cluster Docker Swarm local com Vagrant e no projeto de referência do instrutor.
