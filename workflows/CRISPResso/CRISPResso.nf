#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

process CRISPResso {
    tag "${sample_id}"

    input:
        path read1
        path read2

    // output:
    // tuple val(sample_id), path

    script:
    def base_cmd = "CRISPResso" + " -r1 ${read1}" + " --auto"

    """
    ${base_cmd}
    """
}


workflow {
    input_ch = Channel.of(params.read1)

    CRISPResso(input_ch)
}