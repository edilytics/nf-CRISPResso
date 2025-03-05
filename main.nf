#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    nf-CRISPResso
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Github : https://github.com/edilytics/nf-CRISPResso

*/
include { CRISPResso ; CRISPRessoBatch ; CRISPRessoPooled ; CRISPRessoWGS } from './workflows/CRISPResso'

workflow {
    CRISPResso(Channel.fromPath(params.input_dir))
}
