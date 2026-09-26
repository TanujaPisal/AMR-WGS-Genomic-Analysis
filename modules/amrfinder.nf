process AMRFINDER {

    tag "$sample_id"

    publishDir "${projectDir}/results/amr/${sample_id}", mode: 'copy'

    input:
    tuple val(sample_id), path(assembly)

    output:
    tuple val(sample_id), path("${sample_id}_amrfinder.tsv"), emit: amr_results

    script:
    """
    amrfinder \
        -n ${assembly} \
        -o ${sample_id}_amrfinder.tsv
    """
}