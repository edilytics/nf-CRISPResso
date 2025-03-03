#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    nf-CRISPResso
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Github : https://github.com/edilytics/nf-CRISPResso

*/
include { CRISPResso } from './workflows/CRISPResso'
include { CRISPRessoBatch } from './workflows/CRISPResso'
include { CRISPRessoPooled } from './workflows/CRISPResso'
include { CRISPRessoWGS } from './workflows/CRISPResso'

params.input_dir = './data'

workflow {
    CRISPRessoBatch(Channel.fromPath(params.input_dir)) | view
}
