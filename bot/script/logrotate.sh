rm -f /tmp/logrotate.conf
cat <<EOF > /tmp/logrotate.conf
/databot/bot/$LOG_FILE_PATH_FROM_BOT {
  rotate 20
  size 1k

  # compress
  # delaycompress
  # create
  copytruncate

  notifempty
  missingok
}
EOF

while true; do
  logrotate /tmp/logrotate.conf
  sleep 10 # Sleep for 300 seconds (5 minutes)
done
