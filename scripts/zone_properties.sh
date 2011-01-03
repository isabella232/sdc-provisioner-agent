#!/bin/bash

PATH=/usr/bin:/sbin:/usr/sbin
export PATH

if [ -z "$ZONENAME" -o -z "$ZPOOL_NAME" ]; then
  echo "Missing ZONENAME or ZPOOL_NAME" >&2
  exit 1
fi

if [ ! -z "$OWNER_UUID" ]; then
  zfs set "smartdc:owner_uuid"="$OWNER_UUID" "$ZPOOL_NAME/$ZONENAME"
fi

if [ ! -z "$CHARGE_AFTER" ]; then
  zfs set "smartdc:charge_after"="$CHARGE_AFTER" "$ZPOOL_NAME/$ZONENAME"
fi

if [ ! -z "$ZONE_TYPE" ]; then
  zfs set "smartdc:zone_type"="$ZONE_TYPE" "$ZPOOL_NAME/$ZONENAME"
fi

if [ ! -z "$ZA_VERSION" ]; then
  zfs set "smartdc:za_version"="$ZA_VERSION" "$ZPOOL_NAME/$ZONENAME"
fi
