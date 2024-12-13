# OpenSIPS IMS CSCF - Community Edition - Configuration


The OpenSIPS IMS Community Edition scripts can be configured using environment
variables. These variables are utilized by the OpenSIPS pre-processing script
(via the `-p` parameter) at startup, so they must be exported in the
environment where each component is running.

_Note_: Docker Open5GS already includes all these variables in the
[`.env`]() file, so you don't necessarily need to explicitely tune them unless
really needed.

## Environment Variables

The following environemnt variables are being used:

| Environment Variable | Components | Description                    | Default |
|----------------------|------------|--------------------------------|---------|
| `MCC`                | P/I/S      | Mobile Country Code            | `001`   |
| `MNC`                | P/I/S      | Mobile Network Code            | `01`    |
| `DOMAIN`     | P/I/S | Root Domain handled  | `mnc${MNC}.mcc${MCC}.3gppnetwork.org` |
| `IMS_DOMAIN` | P/I/S | IMS Domain handled   | `ims.${DOMAIN}` |
| `EPC_DOMAIN` | P/I/S | EPC Domain           | `epc.${DOMAIN}` |
| `PCSCF_BIND_PORT` | P | Diameter port used by P-CSCF | `3871`        |
| `PCSCF_IP`        | P | IP of the P-CSCF             | `172.22.0.21` |
| `ICSCF_BIND_PORT` | I | Diameter port used by I-CSCF | `3869`        |
| `ICSCF_IP`        | I | IP of the I-CSCF             | `172.22.0.19` |
| `SCSCF_BIND_PORT` | S | Diameter port used by S-CSCF | `3870`        |
| `SCSCF_IP`        | S | IP of the S-CSCF             | `172.22.0.20` |
| `MYSQL_IP` | S | Used by S-CSCF to store information about dialplan | `172.22.0.17` |
| `RTPENGINE_IP` | P | Used to communicate with RTPEngine | `172.22.0.16` |
| `PYHSS_BIND_PORT` | I/S | Diameter port the HSS is listening on | `3875`|
| `PCRF_BIND_PORT`  | P   | Diameter port the HSS is listening on | `3873`|
| `UPF_IP` | P | Used by P-CSCF to route traffic back through UPF | `172.22.0.8` |

<sub>
<sup>*</sup> The components field contains one of the initials of the CSCF sub-component.
</sub>

<sub>
<sup>**</sup> The default variables are mainly provided by the Docker Open5GS project - 
in case you are using a different setup, make sure you set them accordingly.
</sub>
