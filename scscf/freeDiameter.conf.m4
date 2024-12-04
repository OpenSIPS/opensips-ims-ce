Identity = "scscf.${IMS_DOMAIN}";
Realm = "${IMS_DOMAIN}";
Port = ${SCSCF_BIND_PORT};
SecPort = 0;
No_SCTP;
NoRelay;

ConnectPeer = "hss.${IMS_DOMAIN}" {
  No_TLS;
  port = ${PYHSS_BIND_PORT};
};
