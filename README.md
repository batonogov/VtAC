# Video to Audio Converter

Cron внутри контейнера выполняет скрипт, который ходит на $CIFS_PATH с $CIFS_USER и $CIFS_PASS раз в 10 минут и конвертирует все находящиеся там mp4 файлы в mp3 удаляя оригиналы. 

Запуск:
docker run --name converter --privileged -it --restart unless-stopped -e CIFS_USER=user -e CIFS_PASS=password -e CIFS_PATH=//share -d batonogov/vac
