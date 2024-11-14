# This Kurtosis package spins up a local DA

# Update this image based on your da needs
sequencing_image = "ghcr.io/rollkit/go-sequencing:latest"


def run(plan):
    port_number = 50051
    port_spec = PortSpec(
        number=port_number,
        transport_protocol="TCP",
        application_protocol="grpc",
    )
    ports = {
        "grpc": port_spec,
    }
    sequencer = plan.add_service(
        name="local-sequencer",
        config=ServiceConfig(
            image=sequencing_image,
            ports=ports,
            public_ports=ports,
        ),
    )

    # Set the sequencer address to return for rollups
    sequencer_address = "http://{0}:{1}".format(
        sequencer.ip_address, sequencer.ports["grpc"].number
    )

    return sequencer_address
