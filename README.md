# Video to Audio Converter

Cron внутри контейнера выполняет скрипт, который ходит на $CIFS_PATH с $CIFS_USER и $CIFS_PASS раз в 10 минут и конвертирует все находящиеся там mp4 файлы в mp3 удаляя оригиналы. 

Запуск:
`docker run \
    -it \
    --name converter \
    --privileged \
    --restart unless-stopped \
    -e CIFS_PATH=//8.8.8.8/Backup \
    -e CIFS_USER=login \
    -e CIFS_PASS=password \
    -d \
    batonogov/vac`
