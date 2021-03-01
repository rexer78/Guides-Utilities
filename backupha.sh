echo Mi sposto nella cartella /docker/backup

cd /docker/backup

name=$(date '+%d-%m-%Y-%H-%M')
echo Eseguo Backup di Home Assistant Core e AppDaemon in /docker/backup/

tar -zcvf "habck$name.tar.gz" --exclude='/docker/homeassistant/config/appdaemon/logs/*' --exclude='docker/homeassistant/config/home-assistant_v2.db' --exclude='docker/homeassistant/config/home-assistant.log' /docker/homeassistant/*

echo Cancello file piu Vecchi di 30 Giorni in /docker/backup/

find /docker/backup/ -type d -mtime +30 -exec rm habck*.tar.gz \;

echo Eseguo Sync di /docker/backup/ su Google Drive in HACore_Backup

rclone sync /docker/backup/ gdrive:HACore_Backup
