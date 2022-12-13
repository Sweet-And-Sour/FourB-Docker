# The FourB Project

> 동의대학교 응용소프트웨어공학과 웹프로그래밍2 프로젝트  
> 새콤달콤 팀 (프로젝트 명: FourB)

## 개발 환경 준비

1. Git

-   [Git download](https://git-scm.com/downloads)

2. Docker

-   [Docker Desktop download](https://www.docker.com/products/docker-desktop/)
-   [Docker install manuals](https://docs.docker.com/engine/install/)

## Usages

```bash
# Get the repository
$ git clone "https://github.com/Sweet-And-Sour/FourB-Docker.git" FourB

# Move to directory
$ cd ./FourB

# Get frontend
$ git clone "https://github.com/Sweet-And-Sour/FourB-Frontend.git" ./src/Frontend

# Get backend
$ git clone "https://github.com/Sweet-And-Sour/FourB-Backend.git" ./src/Backend

# Run yarn command in frontend
$ cd ./src/frontend
$ yarn
$ yarn generate
$ cd ../../

# Run yarn command in backend
$ cd ./src/backend
$ yarn
$ cd ../../

# Build
$ docker-compose build
```

```bash
# 실행 전에 Docker가 켜져 있는지 확인하세요!

# Running
$ docker-compose up -d

# Check
$ docker ps -a
```

```bash
# DB 초기화 하기 (필수 과정!)
$ docker exec -it fourB_db bash

# DB 접속
> mysql -uroot -proot

# 만약에 이전에 만들어둔 DB가 있다면
MariaDB [(none)]> DROP DATABASE FourB;

# 새로운 DB를 생성
MariaDB [(none)]> CREATE DATABASE FourB;

MariaDB [(none)]> \q

# 초기화 스크립트 실행
> cd /home/
> bash db_init.sh

# 컨테이너 빠져나오기
> exit
```

```bash
# DB 데이터 집어 넣기
$ docker exec fourB_db mysql -uroot -proot FourB < backup.sql
```

``` bash
# Exit (나중에 서버 종료할 때!)
$ docker-compose down
```

-   Frontend는 웹브라우저에서 `localhost` 로 접속할 수 있습니다.
-   Backend는 `localhost/api` 로 접속할 수 있습니다.
-   `localhost/api/dev/`에 접속해서 API 목록을 확인해 보세요!

## Volumes

-   data : DB 파일들 입니다. (data 폴더 삭제시 DB에 저장된 데이터 삭제됨)
-   logs : Container의 로그 파일을 확인할 수 있습니다.

## Containers

### Nginx

-   [Nginx Docker Image](https://hub.docker.com/_/nginx)
-   설정 파일은 Nginx 홈페이지에서 찾아볼 수 있습니다. ([Full Example Configuration](https://www.nginx.com/resources/wiki/start/topics/examples/full/))
-   Nginx의 reverse proxy 기능을 사용해서 Frontend와 Backend로 접속할 수 있습니다.
-   `localhost:80`

### DB (MariaDB)

-   [MariaDB Docker Image](https://hub.docker.com/_/mariadb)
-   Host OS에서 DB에 접근할 때는 `0.0.0.0:3306` 으로 접근가능 합니다.

### Frontend

-   [Node Docker Image](https://hub.docker.com/_/node)
-   [Git Repository](https://github.com/Sweet-And-Sour/FourB-Frontend)
-   Node + Yarn
-   Nuxt Frameworks
-   `localhost:3001`

### Backend

-   [Node Docker Image](https://hub.docker.com/_/node)
-   [Git Repository](https://github.com/Sweet-And-Sour/FourB-Backend)
-   Node + Yarn
-   Nest.JS Frameworks
-   `localhost:3000`

## 로그 확인 방법

```bash
$ docker logs [Container Name]
```

```bash
$ docker logs fourB_nginx

$ docker logs fourB_db

$ docker logs fourB_frontend

$ docker logs fourB_backend
```

## Container 내부에서 SQL 처리하기

```bash
$ docker exec -it fourB_db bash

$ mysql -uroot -p
Enter password: root

MariaDB [(none)]> \q

$ exit
```

## 로컬 환경에서 DB에 접속하기
- IP주소: 0.0.0.0
- Username: root
- Password: root

## DB 초기화 방법

```bash
$ docker exec -it fourB_db bash

$ /home/db_init.sh

$ exit
```

## 예시 DB 백업 파일
- [backup.zip](https://github.com/Sweet-And-Sour/FourB-Docker/files/10220788/backup.zip)

