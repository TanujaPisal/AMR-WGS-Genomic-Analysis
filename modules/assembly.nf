process ASSEMBLY {

    tag "$sample_id"

    publishDir "${projectDir}/results/assembly/${sample_id}", mode: 'copy', pattern: "scaffolds.fasta"
    publishDir "${projectDir}/results/assembly/${sample_id}", mode: 'copy', pattern: "contigs.fasta"
    publishDir "${projectDir}/results/assembly/${sample_id}", mode: 'copy', pattern: "spades.log"

    input:
    tuple val(sample_id), path(read1), path(read2)

    output:
    tuple val(sample_id), path("scaffolds.fasta"), emit: assemblies
    path "contigs.fasta"
    path "spades.log"

    script:
    """
    spades.py \
        -1 ${read1} \
        -2 ${read2} \
        -o spades_output \
        --careful \
        -t 4 \
        -m 6

    cp spades_output/scaffolds.fasta .
    cp spades_output/contigs.fasta .
    cp spades_output/spades.log .
    """
}