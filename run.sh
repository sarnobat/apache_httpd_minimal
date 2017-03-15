apache2 \
    -f /dev/null \
    -C "DocumentRoot $PWD" \
    -C 'Listen 7000' \
    -C 'PidFile /tmp/pidfile' \
    -C 'ErrorLog /dev/stdout' \
    -D FOREGROUND
