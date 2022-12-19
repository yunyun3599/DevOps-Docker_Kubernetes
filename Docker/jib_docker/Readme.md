## Jib을 이용해 Docker를 빌드하고 push
```sh
$ ./gradlew clean build
$ ./gradlew jib
```

위의 명령어가 완료되면 원격 리포지토리에 빌드된 이미지가 올라감.
해당 이미지를 Pull 받아서 실행시키면 됨  
```sh
$ docker pull yoonjae/jib-test:1.0
$ docker run --rm  -p 8080:8080 yoonjae/jib-test:1.0
```