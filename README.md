# OpenSIPS IMS - Community Edition

This project provides a fully working IMS (IP Multimedia Subsystem) CSCF (Call
Session Control Function) component compliant with the 3GPP specifications for
IMS and VoLTE integration.

Currently, the project includes the following essential IMS CSCF sub-components:

* [P-CSCF](docs/pcscf.md) (Proxy CSCF): Acts as the entry point for SIP
  signaling, providing initial security, routing, and NAT traversal
  functionalities.
* [I-CSCF](docs/icscf.md) (Interrogating CSCF): Manages SIP signaling for
  session control and ensures secure interactions between home and external
  networks.
* [S-CSCF](docs/scscf.md) (Serving CSCF): Handles session management, including
  registration, authentication, and routing for end-user SIP sessions.

Each sub-component adheres to the IMS standards outlined in TS 124 228,
ensuring compatibility and enabling seamless integration as a replacement in an
existing (non OpenSIPS-based) IMS setup.

The project is designed to seamlessly integrate and provide the IMS
functionality within the Dockerized Open5GS 4G core network, incorporating all
the essential CSCF (Call Session Control Function) Docker components for a
fully integrated solution.

## Getting Started

The IP Multimedia Subsystem (IMS) must operate on top of an existing core
network, such as a 4G Evolved Packet Core (EPC) or a 5G Core (5GC). A
straightforward method to set up such a network is by using the
[Docker Open5GS](https://github.com/herlesupreeth/docker_open5gs)
project, which offers a Dockerized container solution for running a 4G/5G
network.

Follow the [Getting Started](docs/getting-started.md) tutorial to set up IMS
within the Docker Open5GS environment.

## Configuration

Each component's script can be customized using various environment variables.
The [Configuration](docs/config.md) page provides a comprehensive list of all
the adjustable variables.

Detailed information about the configuration and tuning of each sub-component
can be found on its dedicated page.

## Documentation

Documentation pages contain the following topics:

* [P-CSCF](docs/pcscf.md) - information about P-CSCF sub-component
* [I-CSCF](docs/icscf.md) - information about I-CSCF sub-component
* [S-CSCF](docs/scscf.md) - information about S-CSCF sub-component
* [Getting Started](docs/getting-started.md) - show how you can setup OpenSIPS
  IMS Community Edition in the Docker Open5GS environment
* [Configuration](docs/config.md) - detailed information about configuration


## Contribute

This project is Community driven, therefore any contribution is welcome. Feel
free to open a pull request for any fix/feature you find useful.

## License

<!-- License source -->
[License-GPLv3]: https://www.gnu.org/licenses/gpl-3.0.en.html "GNU GPLv3"
[Logo-CC_BY]: https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Common Logo"
[License-CC_BY]: https://creativecommons.org/licenses/by/4.0/legalcode "Creative Common License"

The `OpenSIPS IMS Community Edition` source code is licensed under the [GNU General Public License v3.0][License-GPLv3]

All documentation files (i.e. `.md` extension) are licensed under the [Creative Common License 4.0][License-CC_BY]

![Creative Common Logo][Logo-CC_BY]

© 2024 - SIP Point Consulting SRL
