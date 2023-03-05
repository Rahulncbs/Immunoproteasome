# Immunoproteasome
Analysis of constitutive and Immunoproteasome expression level in solid tumors

Make the following directories in yourcurrent path to run the R script and notebooks
## Notebook details

[Exploring_proteasome_expression_pan_cancer](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Exploring_proteasome_expression_pan_cancer.ipynb)

[Differential_immune_cells_enrichment](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Differential_immune_cells_enrichment.ipynb)

[Differential_pathways_analysis.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Differential_pathways_analysis.ipynb)

[EMT_correlation_analysis.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/EMT_correlation_analysis.ipynb)

[Copy_no_alteration_mutation_analysis.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Copy_no_alteration_mutation_analysis.ipynb)

[Survival_analysis_IP_CP.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Survival_analysis_IP_CP.ipynb)

[TNF_alpha_TGFB1_inducing_proteasome_expr_analysis.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/TNF_alpha_TGFB1_inducing_proteasome_expr_analysis.ipynb)

[Methylation_and_upstream_pathways_IP_analysis.ipynb](https://github.com/Rahulncbs/Immunoproteasome/blob/main/Methylation_and_upstream_pathways_IP_analysis.ipynb)

[immune_cells_gsva.R](https://github.com/Rahulncbs/Immunoproteasome/blob/main/immune_cells_gsva.R)

[pathways_gsva.R](https://github.com/Rahulncbs/Immunoproteasome/blob/main/pathways_gsva.R)

[epi_mes_gsva.R](https://github.com/Rahulncbs/Immunoproteasome/blob/main/epi_mes_gsva.R)

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
mkdire data/EMT_data
```


**./data** contains all the input data for the analysis. tcga tumor gene expression data, GTEx normal gene expression data, tumor mutation burden, TCGA purity data,

**./plots** contains all the plots generated and provided in the figure

**./supplementart_tables** conatins all the result

**./data/tcga_tumor** contans the TCGA gene expression data

**./data/gtex_normal** contains the GTEx gene expression data downloaded from https://toil-xena-hub.s3.us-east-1.amazonaws.com/download/gtex_RSEM_Hugo_norm_count.gz 

**./data/r_input** contains the input data for computing gsva score

**./data/r_output** contains the resulting gsva scroe and differential enrichment score for immune cells and pathways

**./data/r_input/gene_exp** contains the gene expression from tcga to run the r script
**./data/EMT_data** contains the time course gene expression data which can be downloaded from here




**Required data** 
```
unzip the data folder 
put all the data file from tcga_tumor folder to ./data/tcga_tumor directory.
put the gene signature file Epithelial_Mesenchymal_gene_list.csv, hall_mark_genes_df.csv, immune_and_pathways_gene_list.xlsx  to ./data/r_input directory.
leave the rest of the files in the ./data directory
Download the additon GTEx normal gene expression data from  https://toil-xena-hub.s3.us-east-1.amazonaws.com/download/gtex_RSEM_Hugo_norm_count.gz  and put in the ./data/gtex_normal directory.
```


