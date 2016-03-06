#Docker OpenVPN-client#
[![Build Status](https://jenkins.dray.be/buildStatus/icon?job=docker_openvpn-client)](https://jenkins.dray.be/job/docker_openvpn-client)

This is a docker image for connecting to an OpenVPN server and allowing other container's traffic to be routed via it.

The privileged option is required to be able to create a tun/tap adapter and the network connections

##Usage##
Start up a VPN container with your VPN configuration, then any containers you want can be linked to it for their network connection to use it
1. `docker run --rm --privileged --name=vpn -v /path/to/config:/config:ro justin8/openvpn-client`
2. `docker run --rm -it --net=container:vpn alpine sh`

And your second container will have all networking via the vpn container. Double check with ping/traceroute/mtr if you want to verify this

If you would like to use it with docker-compose, see the included docker-compose.yml file. The trick is port forwards need to happen on the vpn container; since --net=container makes them all share the same exact network stack, and docker-compose doesn't allow the port option on any container/service network modes.
