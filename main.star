da = import_module("da.star")
sequencer = import_module("sequencing.star")


def run(plan):
    # Start the DA service
    da_address = da.run(
        plan,
    )
    plan.print("connecting to da layer via {0}".format(da_address))

    # Start the sequencing service
    sequencer_address = sequencer.run(
        plan,
    )
    plan.print("connecting to sequencer via {0}".format(sequencer_address))
