process FASTP {

    tag "$sample_id"

    publishDir "${projectDir}/data/fastq/trimmed", mode: 'copy', pattern: "*.fastq.gz"
    publishDir "${projectDir}/results/qc/trimmed", mode: 'copy', pattern: "*.html"
    publishDir "${projectDir}/results/qc/trimmed", mode: 'copy', pattern: "*.json"

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}_trimmed_1.fastq.gz"), path("${sample_id}_trimmed_2.fastq.gz"), emit: trimmed_reads
    path "${sample_id}_fastp.html"
    path "${sample_id}_fastp.json"

    script:
    """
    fastp \
        -i ${reads[0]} \
        -I ${reads[1]} \
        -o ${sample_id}_trimmed_1.fastq.gz \
        -O ${sample_id}_trimmed_2.fastq.gz \
        --detect_adapter_for_pe \
        --thread 4 \
        --html ${sample_id}_fastp.html \
        --json ${sample_id}_fastp.json
    """
}