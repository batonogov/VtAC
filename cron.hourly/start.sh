echo $(date)

mkdir /tmp/lan

until mount -t cifs $CIFS_PATH /tmp/lan -o user=$CIFS_USER,password=$CIFS_PASS
do
    echo $(date)
    sleep 60
done

cd /tmp/lan

until python3 /convert.py
do
    echo $(date)
    sleep 60
done

sleep 60
umount /tmp/lan && rm -rf /tmp/lan
