# OpenSIPS IMS - Community Edition - Getting Started

This page provides a guide on setting up the OpenSIPS IMS Community Edition
within the [Docker Open5GS](https://github.com/herlesupreeth/docker_open5gs)
Core network. This is the simplest way to get the OpenSIPS IMS running.

## Setup Docker Open5GS

This section describes how to set up the Core Network.

1. Clone the [Docker Open5GS](https://github.com/herlesupreeth/docker_open5gs)
repository:
```
git clone https://github.com/herlesupreeth/docker_open5gs.git
cd docker_open5gs
```

2. Clone the [OpenSIPS IMS](https://github.com/OpenSIPS/opensips-ims-ce)
repository:
```
git clone https://github.com/OpenSIPS/opensips-ims-ce.git
```

3. Adjust the environment variables according to your setup/networking layout
by editting the `.env` file, as described
[here](https://github.com/herlesupreeth/docker_open5gs?tab=readme-ov-file#network-and-deployment-configuration).
Pay attention to the `DOCKER_HOST_IP` and `SGWU_ADVERTISE_IP` variables, which
should be set to the value of your host. Make sure you follow the Docker
Open5GS tutorial for more complex setups.

4. Build the Docker images as described
[here](https://github.com/herlesupreeth/docker_open5gs?tab=readme-ov-file#build-docker-images-from-source)
or get the pre-built ones as instructed
[here](https://github.com/herlesupreeth/docker_open5gs?tab=readme-ov-file#get-pre-built-docker-images).
OpenSIPS images are already available in
[Docker Hub](https://hub.docker.com/r/opensips/opensips), all you need to do is
to pull the `opensips/opensips:ims-ce` image:
```
docker pull opensips/opensips:ims-ce
```

5. Deploy the Core Network along with the OpenSIPS IMS CSCF components:
```
cp opensips-ims-ce/docker-compose.yml 4g-volte-deploy-opensips.yaml
docker compose -f 4g-volte-deploy-opensips.yaml up -d
```

At this point, all the necessary components should be up and running.

## Setup SIM information

To register phones in the core network, you need to program their SIMs and
provision the information in the platform.

1. Program your SIM cards(USIM) to use the configured network. You can follow
[this](https://open5gs.org/open5gs/docs/tutorial/01-your-first-lte/#usim-setup) tutorial.

2. Provision the SIMs in the Open5GS HSS (Home Subscriber Server). Follow
[these](https://github.com/herlesupreeth/docker_open5gs?tab=readme-ov-file#provisioning-of-sim-information)
steps to do that.

3. Provision the SIMs in the IMS HSS (pyHSS). Follow
[these](https://github.com/herlesupreeth/docker_open5gs?tab=readme-ov-file#provisioning-of-sim-information-in-pyhss-is-as-follows)
steps for that.

## Configure Dialplan (optional)

The S-CSCF considers every dialled number as being a user and handles it
accordingly. However, you can also add custom rules for handling different
other services or applications. For example, to add a dialplan rule that sends
all the calls dialling `*99` to the voicemail box, you can follow these steps:
```
# login in mysql scscf database
docker exec -it mysql mysql scscf
# insert the dialplan rule, with the associated type
insert into dialplan (dpid, match_op, match_exp, repl_exp) values (1, 1, "^\*99$", "SERVICE");
```
<sub><sup>*</sup> voicemail handling is currently not handled</sub>.

Of course, you can set multiple rules, according to your dialplan. Once
everything is set up, we need to reload OpenSIPS's dialplan cache.

More information about the dialplan provisioning can be found in the
[S-CSCF configuration](scscf.md#configuration) section.

```
docker exec -it scscf opensips-mi dp_reload
```

## Testing

At this stage, you should be able to register your phones, equipped with the
SIMs provisioned earlier, to the Open5GS core network. If the configuration has
been completed successfully, the VoLTE icon should appear on all devices, and
it should be possible to initiate a call between two UEs by dialing their
respective MSISDNs.

## References

* [Open5GS project](https://open5gs.org)
* [Docker Open5GS project](https://github.com/herlesupreeth/docker_open5gs)
* More information about testing and troubleshooting can be found
  [here](https://open5gs.org/open5gs/docs/tutorial/03-VoLTE-dockerized/)
