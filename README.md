# FourB-Docker

> 동의대학교 응용소프트웨어공학과 웹프로그래밍2 프로젝트  
> 새콤달콤 팀 (프로젝트 명: FourB)  

## 개발 환경 준비
1. Git
2. Docker

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

# Build
$ docker-compose build
```

```bash
# 실행 전에 Docker가 켜져 있는지 확인하세요!

# Running
$ docker-compose up -d

# Check
$ docker ps -a

# Exit
$ docker-compose down
```

## Volumes
- data : DB 파일들 입니다. (data 폴더 삭제시 DB에 저장된 데이터 삭제됨)
- logs : Container의 로그 파일을 확인할 수 있습니다.

## Containers
### Nginx
- [Nginx Docker Image](https://hub.docker.com/_/nginx)
- 설정 파일은 Nginx 홈페이지에서 찾아볼 수 있습니다. ([Full Example Configuration](https://www.nginx.com/resources/wiki/start/topics/examples/full/))
- `localhost:80`

### DB (MariaDB)
- [MariaDB Docker Image](https://hub.docker.com/_/mariadb)
- Host OS에서 DB에 접근할 때는 `0.0.0.0:3306` 으로 접근가능 합니다.

### Frontend
- [Node Docker Image](https://hub.docker.com/_/node)
- [Git Repository](https://github.com/Sweet-And-Sour/FourB-Frontend)
- Node + Yarn
- Nuxt Frameworks
- `localhost:3001`

### Backend
- [Node Docker Image](https://hub.docker.com/_/node)
- [Git Repository](https://github.com/Sweet-And-Sour/FourB-Backend)
- Node + Yarn
- Nest.JS Frameworks
- `localhost:3000`

## 로그 확인 방법
```bash
$ docker logs [Container Name]
```

```bash
$docker logs fourB_nginx

$docker logs fourB_db

$docker logs fourB_frontend

$docker logs fourB_backend
```
