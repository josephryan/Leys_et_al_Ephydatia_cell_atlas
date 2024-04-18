# Leys_et_al_Ephydatia_cell_atlas
Analyses from Leys et al. - An atlas of morphology of the freshwater sponge Ephydatia muelleri

1. To recreate the conda environment that was active during these analyses (see conda_package_versions in this repo)

```bash
conda create --name <env> --file conda_package_versions
conda activate <env>
```
  
2. For each sample, align sequences and estimate transcript counts

```bash
/usr/local/trinityrnaseq-Trinity-v2.8.5/util/align_and_estimate_abundance.pl --transcripts Emu_genome_v1.mrna --seqType fq --left 23233R-03-01_S44_L005_R1_001.fastq.gz --right 23233R-03-01_S44_L005_R2_001.fastq.gz --output_dir C1 --est_method RSEM --aln_method bowtie2 --thread_count 45 --prep_reference > C1.out 2> C1.err
```

2. create matrix of counts

 ```bash
/usr/local/trinityrnaseq-Trinity-v2.8.5/util/abundance_estimates_to_matrix.pl --est_method RSEM --gene_trans_map none --out_prefix atlas_sc --name_sample_by_basedir C1/RSEM.genes.results C2/RSEM.genes.results ... > aem.out 2> aem.err
```

3. Run differential gene expression analysis (samples.txt from this repo)

```bash
/usr/local/trinityrnaseq-Trinity-v2.8.5/Analysis/DifferentialExpression/run_DE_analysis.pl --matrix atlas_sc.isoform.counts.matrix --method voom --samples_file samples.txt > rde.out 2> rde.err```
```
4. Run principal components analysis (samples.txt from this repo)

```bash
/usr/local/trinityrnaseq-Trinity-v2.8.5/Analysis/DifferentialExpression/PtR --matrix atlas_sc.isoform.counts.matrix --samples samples.txt --min_rowSums 10 --log2 --CPM --center_rows --prin_comp 3 > ptr.out 2> ptr.err  
```

5. Cluster differentially expressed transcripts
```bash
/usr/local/trinityrnaseq-Trinity-v2.8.5/Analysis/DifferentialExpression/analyze_diff_expr.pl --matrix ../atlas_sc.isoform.counts.matrix --samples ../samples.txt -P 0.01 -C 1.5 --output ade_atlas > ade.out 2> ade.err
```
