# nf-CRISPResso
A Nextflow workflow for CRISPResso.

This repository contains resources for integrating CRISPResso2 into your Nextflow projects.

## Documentation
For more information on Nextflow, refer to the [Nextflow documentation](https://www.nextflow.io/docs/latest/).

## Workflow Structure
- `/workflows/CRISPResso/main.nf` contains processes for:
  - `CRISPResso`
  - `CRISPRessoBatch`
  - `CRISPRessoPooled`
  - `CRISPRessoWGS`
- `./main.nf` provides an example workflow demonstrating how to use CRISPResso processes.

## Usage
- CRISPResso processes expect a directory containing all data files as the input channel.
- All CRISPResso parameters can be passed through the command line using `--param value` or set in `nextflow.config`.

