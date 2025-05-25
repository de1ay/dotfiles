#!/usr/bin/env bash

if [ "$SENDER" = "front_app_switched" ]; then
	APP_NAME=$INFO
else
	APP_NAME=$(sketchybar --query front_app | jq .label.value | tr -d "\"")
fi

BUNDLE_IDENTIFIER=$(aerospace list-apps | grep "$APP_NAME$" | awk '{print $3}')
APPTIME=$(curl 127.0.0.1:5501/app/$BUNDLE_IDENTIFIER)

sketchybar --set "$NAME" label="$APPTIME"
