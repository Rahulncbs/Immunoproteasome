# Immunoproteasome
Analysis of constitutive and Immunoproteasome expression level in solid tumors

Make the following directories in yourcurrent path to run the R script and notebooks
## Notebook details
Exploring_proteasome_expression_pan_cancer

Create the data folder
```
mkdir data
mkdir plots
mkdir supplementary_tables
mkdir data/tcga_tumor
mkdir data/gtex_normal
mkdir data/r_input
mkdir data/r_output
mkdir data/r_input/gene_exp
```

```
**./data** contains all the input data for the analysis. tcga tumor gene expression data, GTEx normal gene expression data, tumor mutation burden, TCGA purity data,

./plots contains all the plots generated and provided in the figure

./supplementart_tables conatins all the result

./data/tcga_tumor contans the TCGA gene expression data

./data/gtex_normal contains the GTEx gene expression data downloaded from https://toil-xena-hub.s3.us-east-1.amazonaws.com/download/gtex_RSEM_Hugo_norm_count.gz 

./data/r_input contains the input data for computing gsva score

./data/r_output contains the resulting gsva scroe and differential enrichment score for immune cells and pathways

./data/r_input/gene_exp contains the gene expression from tcga to run the r script
```


*Required data
