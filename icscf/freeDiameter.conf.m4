Identity = "icscf.${IMS_DOMAIN}";
Realm = "${IMS_DOMAIN}";
Port = ${ICSCF_BIND_PORT};
SecPort = 0;
No_SCTP;
NoRelay;

ConnectPeer = "hss.${IMS_DOMAIN}" {
  No_TLS;
  port = ${PYHSS_BIND_PORT};
};
