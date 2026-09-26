process FASTQC_TRIMMED {

    tag "$sample_id"

    publishDir "${projectDir}/results/qc/trimmed/fastqc", mode: 'copy'

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    tuple val(sample_id), path("*_fastqc.html"), path("*_fastqc.zip"), emit: qc

    script:
    """
    fastqc ${read1} ${read2} --outdir . --threads 4
    """
}