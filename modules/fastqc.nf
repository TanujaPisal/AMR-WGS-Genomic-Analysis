process FASTQC {

    tag "$sample_id"

    publishDir "${projectDir}/results/qc/raw", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("*_fastqc.html"), path("*_fastqc.zip"), emit: qc

    script:
    """
    fastqc ${reads} --outdir . --threads 4
    """
}