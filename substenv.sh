#!/bin/bash

test -z "${DOMAIN}" && test ${#MNC} == 3 && \
	DOMAIN="mnc${MNC}.mcc${MCC}.3gppnetwork.org" || \
	DOMAIN="mnc0${MNC}.mcc${MCC}.3gppnetwork.org"
IMS_DOMAIN=${IMS_DOMAIN:-ims.${DOMAIN}}
EPC_DOMAIN=${EPC_DOMAIN:-epc.${DOMAIN}}
export EPC_DOMAIN IMS_DOMAIN
ENV="$(printf '${%s} ' $(env | cut -d'=' -f1))"
DIAMETER_FILE=/etc/opensips/freeDiameter.conf.m4
test -f "${DIAMETER_FILE}" && cat "${DIAMETER_FILE}" | \
	envsubst "${ENV}" > ${DIAMETER_FILE%.*}
envsubst "${ENV}"

