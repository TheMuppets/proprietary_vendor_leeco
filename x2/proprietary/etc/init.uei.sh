#!/system/bin/sh

UEIUSER=$(stat -c '%U' /data/data/com.uei.quicksetsdk.letv/)

if [ -n "$UEIUSER" ]; then
	if [ ! -f /data/data/com.uei.quicksetsdk.letv/files/Settings ]; then

		# Copy Settings file
        mkdir -p /data/data/com.uei.quicksetsdk.letv/files
        cp /system/etc/UEISettings /data/data/com.uei.quicksetsdk.letv/files/Settings

		# Set permissions
		chmod 751 /data/data/com.uei.quicksetsdk.letv/
        chmod 777 /data/data/com.uei.quicksetsdk.letv/files
        chmod 644 /data/data/com.uei.quicksetsdk.letv/files/Settings

		# Restore ownership
		chown -R "$UEIUSER":"$UEIUSER" /data/data/com.uei.quicksetsdk.letv/
		restorecon -R /data/data/com.uei.quicksetsdk.letv/
	fi
fi

