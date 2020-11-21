echo "[+] Script is running..."
echo " "

while :
do
        CHECK1="$(md5sum $1)"
        DATE="$(date)"
        sleep 5
        CHECK2="$(md5sum $1)"
        if [[ "$CHECK1" != "$CHECK2" ]]; then
                echo "PANIC at $DATE"
        fi
done
