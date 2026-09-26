include { FASTQC } from '../modules/fastqc'
include { FASTP } from '../modules/fastp'
include { FASTQC_TRIMMED } from '../modules/fastqc_trimmed'
include { ASSEMBLY } from '../modules/assembly'
include { AMRFINDER } from '../modules/amrfinder'

workflow AMR_WORKFLOW {

    reads_ch = Channel.fromFilePairs(
        "${projectDir}/data/fastq/*_{1,2}.fastq.gz",
        checkIfExists: true
    )

    raw_qc = FASTQC(reads_ch)

    trimmed = FASTP(reads_ch)

    post_trim_qc = FASTQC_TRIMMED(trimmed.trimmed_reads)

    assemblies = ASSEMBLY(trimmed.trimmed_reads)

    amr_results = AMRFINDER(assemblies.assemblies)
}