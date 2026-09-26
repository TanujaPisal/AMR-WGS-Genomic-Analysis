process AMR_MATRIX {

    publishDir "${projectDir}/results/amr", mode: 'copy'

    input:
    path amr_files

    output:
    path "amr_gene_presence_absence.tsv"

    script:
    """
    python ${projectDir}/scripts/create_amr_matrix.py
    """
}