Identity = "pcscf.${IMS_DOMAIN}";
Realm = "${IMS_DOMAIN}";
Port = ${PCSCF_BIND_PORT};
SecPort = 0;
No_SCTP;
NoRelay;

ConnectPeer = "pcrf.${EPC_DOMAIN}" {
  No_TLS;
  port = ${PCRF_BIND_PORT};
};
