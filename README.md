# nf-CRISPResso
A Nextflow workflow for CRISPResso.

This repository contains resources for integrating CRISPResso2 into your Nextflow projects.

For more information on Nextflow, refer to the [Nextflow documentation](https://www.nextflow.io/docs/latest/).

## Workflow Structure
- `/workflows/CRISPResso/main.nf` contains processes for:
  - `CRISPResso`
  - `CRISPRessoBatch`
  - `CRISPRessoPooled`
  - `CRISPRessoWGS`
- `main.nf` provides an example workflow demonstrating how to use CRISPResso processes.

## Usage

A `main.nf` file like this:

```
include { CRISPResso } from './workflows/CRISPResso'


params.input_dir = './data'

workflow {
    CRISPResso(Channel.fromPath(params.input_dir))
}
```
can be executed like this:

```
nextflow main.nf --r1 ./input_dir/FANC.Cas9.fastq --auto
```

- Nextflow will use your local installation of CRISPResso, for example in a Conda environment.
- CRISPResso processes expect a path to the directory containing all data files as an input channel which is named `input_dir` in the CRISPResso nextflow process.
- All CRISPResso parameters can be passed through the command line using `--param value` or set in `nextflow.config`.
- _ALL_ parameters passed through the command line must use two dashes ('--'). Note: this differs from standard command line usage of CRISPResso, for example `-r1` must be passed to Nextflow as `--r1`.
