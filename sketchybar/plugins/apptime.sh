#!/usr/bin/env bash

if [ "$SENDER" = "front_app_switched" ]; then
	APP_NAME=$INFO
else
	APP_NAME=$(sketchybar --query front_app | jq .label.value | tr -d "\"")
fi

BUNDLE_IDENTIFIER=$(aerospace list-apps | grep "$APP_NAME$" | awk '{print $3}')

FIFO_PATH=/tmp/de1ay/apptime-sketchybar.pipe
if [[ -p $FIFO_PATH ]]; then
	echo $BUNDLE_IDENTIFIER > $FIFO_PATH
	APPTIME=$(cat $FIFO_PATH)
fi

sketchybar --set "$NAME" label="$APPTIME"
