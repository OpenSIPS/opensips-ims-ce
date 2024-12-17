# OpenSIPS IMS - Community Edition - I-CSCF

The Interrogating - Call Session Control Function (I-CSCF) handles SIP
signaling for session control and facilitates secure interactions between the
home network and external networks.

The I-CSCF receives messages from the P-CSCF and determines the assigned S-CSCF
for a particular user by querying the HSS.

## Interfaces

The I-CSCF implements the following interfaces:

 * `Mw` - (defined in  3GPP TS 24.229) describes the SIP messages exchanged
internally between the CSCF sub-components - in particular, the I-CSCF uses
the SIP `Mw` interface to communicate with P-CSCF and S-CSCF.
 * `Cx` - (defined in 3GPP TS 29.228) - Diameter interface between the I-CSCF
and the IMS HSS. Supported Diameter commands are:
   * `UAR` - User-Authorization-Request sent to HSS in order to request the
authorization of the registration of a multimedia user alocate resources
   * `UAA` - User-Authorization-Answer received from HSS containing the S-CSCF
instance that should handle the multimedia user

## Configuration

The I-CSCF can be configured through the environment variables defined
[here](config.md#environment-variables).
