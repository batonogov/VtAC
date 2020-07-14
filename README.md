# Video to Audio Converter

Cron внутри контейнера выполняет скрипт, который монтирует $CIFS_PATH используя $CIFS_USER и $CIFS_PASS и конвертирует все находящиеся там mp4 файлы в mp3 удаляя оригиналы. 

**Запуск:**
```
docker run \
    -it \
    --name converter \
    --privileged \
    --restart unless-stopped \
    -e CIFS_PATH=//192.168.1.1/public \
    -e CIFS_USER=login \
    -e CIFS_PASS=password \
    -d \
    batonogov/vac
```

**Логи:**
```
docker exec converter cat /var/log/cron.log
```

[GitHub](https://github.com/batonogov/vac) | 
[Docker Hub](https://hub.docker.com/repository/docker/batonogov/vac)
