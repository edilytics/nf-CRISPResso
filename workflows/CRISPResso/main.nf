#!/usr/bin/env nextflow
nextflow.enable.dsl = 2


process CRISPResso {
    input:
    path "input_dir"

    output:
    path "CRISPResso_on*"

    script:

    def base_cmd = "CRISPResso"
    def cmd = buildCommand(base_cmd, params)

    """
    ${cmd}
    """
}

process CRISPRessoPooled {
    input:
    path "input_dir"

    output:
    path "CRISPRessoPooled_on*"

    script:

    def base_cmd = "CRISPRessoPooled"
    def cmd = buildCommand(base_cmd, params)

    """
    ${cmd}
    """
}

process CRISPRessoBatch {
    input:
    path "input_dir"

    output:
    path "CRISPRessoBatch_on*"

    script:

    def base_cmd = "CRISPRessoBatch"
    def cmd = buildCommand(base_cmd, params)

    """
    ${cmd}
    """
}

process CRISPRessoWGS {
    input:
    path "input_dir"

    output:
    path "CRISPRessoWGS_on*"

    script:

    def base_cmd = "CRISPRessoWGS"
    def cmd = buildCommand(base_cmd, params)

    """
    ${cmd}
    """
}

def buildCommand(String base_cmd, Map params) {

    def jsonFile = file("${projectDir}/workflows/CRISPResso/include_args.json")
    def json = jsonFile.text
    def argsList = new groovy.json.JsonSlurper().parseText(json)

    params.each { key, value ->
        // def exclude_list = ['input_dir']
        //TODO: create an inclusion list from args.json
        if (!argsList.contains(key)) {
            return null
        }
        def arg = key.length() < 4 ? "-${key}" : "--${key}"
        if (value instanceof Boolean && value) {
            base_cmd += " ${arg}"
        }
        else if (value instanceof String && !["", "None"].contains(value)) {
            base_cmd += " ${arg} \"${value}\""
        }
        else if (value !instanceof Boolean && value != "" && value != null && value != "None") {
            base_cmd += " ${arg} ${value}"
        }
    }
    return base_cmd
}
