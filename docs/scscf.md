# OpenSIPS IMS - Community Edition - S-CSCF

The Serving Call Session Control Function (S-CSCF) handles the UE registrations,
manages users authentication, SIP sessions routing and external service integration.

The S-CSCF interacts with I-CSCF for registrations and server assignement, and with
P-CSCF and AS (application servers) for calls routing.

## Interfaces

The S-CSCF implements the following interfaces:

 * `Mw` - (defined in  3GPP TS 24.229) describes the SIP messages exchanged
between the S-CSCF and I-CSCF, as well as with different AS (application servers).
 * `Cx` - (defined in 3GPP TS 29.228) - Diameter interface between the S-CSCF
and the IMS HSS. Supported Diameter commands are:
   * `MAR` - Multimedia-Auth-Request sent by the S-CSCF to request security information
for a particular user.
   * `MAA` - Multimedia-Auth-Answer containing information used for digest/AKA authentication

## Configuration

The S-CSCF can be configured through the environment variables defined
[here](config.md#environment-variables).

Additionally, the S-CSCF must have a dial plan provisioned in the MySQL `scscf`
database `dialplan` table to handle call routing effectively. The required
fields in the database are:

 * `dpid` - dialplan ID, needs to be set to `1`
 * `match_op` - matching operator - `0` if a string match is used, `1` if regex
 * `match_exp` - the regular expression used to match the dialled number
 * `repl_exp` - the way the dialled number should be handled. Currently supported values:
   * `USER`: if the dialplan is a user, the call is routed back to a user, if registered
   * `SERVICE`: the call is sent to an internal service - currently not handled
   * `APPLICATION`: the call is sent to an `Application Server` - currently not handled
