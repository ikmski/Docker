# SSHD

## イメージのビルド
```
$ docker build -t ikmski/sshd .
```

## 起動
```
$ docker run -d --rm -e USER_NAME=<user name> -e PASSWORD=<password> -p 2222:22 ikmski/sshd
```
