import csv

input_file = "results/amr/consolidated_amr.tsv"
output_file = "results/amr/amr_gene_presence_absence.tsv"

isolates = [
    "SRR23106236",
    "SRR23106237",
    "SRR23106238",
    "SRR23106353",
    "SRR23106336"
]

genes = set()
presence = set()

with open(input_file, newline="") as f:
    reader = csv.DictReader(f, delimiter="\t")

    for row in reader:
        if row["Type"] != "AMR":
            continue

        isolate = row["Isolate"]
        gene = row["Element_symbol"]

        genes.add(gene)
        presence.add((gene, isolate))

genes = sorted(genes)

with open(output_file, "w", newline="") as f:
    writer = csv.writer(f, delimiter="\t")

    writer.writerow(["Element_symbol"] + isolates)

    for gene in genes:
        row = [gene]

        for isolate in isolates:
            row.append(1 if (gene, isolate) in presence else 0)

        writer.writerow(row)

print(f"Created: {output_file}")
print(f"AMR genes: {len(genes)}")
print(f"Isolates: {len(isolates)}")
