# Slackapp postgresql server

- [SlackApp](http://slackapp.xyz/)

---

Resource: [https://docs.docker.com/engine/examples/postgresql_service/](Dockerize PostgreSQL)

## Others

**Stop docker image:**

```
docker stop image-name
```

**Conection**

First, run `docker ps`

```
$ docker ps

CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS                                      NAMES
5e24362f27f6        eg_postgresql:latest   /usr/lib/postgresql/   About an hour ago   Up About an hour    0.0.0.0:49153->5432/tcp                    pg_test
```

We see PORT : **49157**

Conection setup:

- IP adress: your server IP
- Port: 49157
- user: docker
- pass: docker

Note: Wee need port **49157** to `security group` if you using **AWS EC2**

**Tab Inbound** : 

Type | Protocol | Port range | Source
-----|----------|------------|-------
Custom TCP Rule | TCP | 49157 | ::/0
Custom TCP Rule | TCP | 49157 | 0.0.0.0/0

Look Good! Now, you can use it to hosting dabase for your application :smile:
