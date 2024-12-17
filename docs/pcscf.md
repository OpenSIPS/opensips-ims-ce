# OpenSIPS IMS - Community Edition - P-CSCF

The Proxy - Call Session Control Function (P-CSCF) serves as the initial point
of contact for user equipment in a mobile network. All SIP traffic to and from
the user equipment (UE) is routed through the P-CSCF.

When a UE registers with the network, it establishes an IPSec tunnel to the
P-CSCF in accordance with the 3GPP TS 33.203 specifications (3G Security:
Access Security for IP-based Services). All SIP communication between the UE
and the network is securely transmitted through this tunnel, ensuring
confidentiality and integrity.

On the core network side, the P-CSCF interacts with the home network's I-CSCF
instance to handle call signaling and coordinates with the PCRF to allocate the
necessary resources for the call.

## Interfaces

The P-CSCF implements the following interfaces:

 * `Gm` - (defined in 3GPP TS 24.229) describes the SIP messages that need to
be exchanged in order to enables connectivity between the UE/PGW and the IMS
network (P-CSCF) for registration, authentication, encryption, and session
control. It contains information about the IPSec tunnel establishement and
IMS AKA authentication.
 * `Mw` - (defined in  3GPP TS 24.229) describes the SIP messages exchanged
internally between the CSCF sub-components - in the P-CSCF case, the
interaction between P-CSCF and I-CSCF is done over the `Mw` interface.
 * `Rx` - (defined in 3GPP TS 29.211) - Diameter interface between the P-CSCF
and PCRF used to allocate resources for a UE. Supported Diameter commands are:
   * `AAR` - Authentication and authorization request, sent by the P-CSCF to
alocate resources for registration/calls
   * `AAA` - Answer from PCRF of the resources allocation request
   * `STR` - Session-Termination-Request sent to release resources allocations
   * `ASR` - Abort-Session-Request received from the PCRF when the UE
disconnects from the network

## Configuration

The P-CSCF can be configured through the environment variables defined
[here](config.md#environment-variables).
