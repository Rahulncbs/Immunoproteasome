### Importing packages
library(limma)
library(GSVA)
library(preprocessCore)
library(GSEABase)
library(GSVAdata)
data(c2BroadSets) 
c2BroadSets
library(Biobase)
library(genefilter)
library(RColorBrewer)
library(readxl)

### Importing genes for 50 different hallmark pathways
dat = as.matrix(read.csv("/Users/Rahul/Desktop/R_script/data/Epithelial_Mesenchymal_gene_list.csv", header = TRUE,row.names="X"))
colnames(dat)[1]
geneSets <- list()
for(i in 1:2) 
{
  geneSets[[colnames(dat)[i]]] <- dat[,i]
}

aa<-list.files(path = "/Users/Rahul/Desktop/R_script/gene_exp",pattern = "csv$")
setwd("/Users/Rahul/Desktop/R_script/gene_exp")
for (i in 1:33)
{
  cts <- as.matrix(read.csv(aa[i],row.names="Hybridization.REF"))
  gsva_es <- gsva(cts, geneSets,kcdf="Poisson",mx.diff=1,method='gsva')
  tt<-strsplit(aa[i],split='_',fixed=TRUE)[[1]][3]
  tt<-strsplit(tt,split='.',fixed=TRUE)[[1]][1]
  
  ### writing GSVA score to the output folder
  setwd("/Users/Rahul/Desktop/R_script/output") 
  write.table(gsva_es, file=paste("GSVA_epithelial_mesenchymal_score_",tt,".tsv",sep =""), sep="\t")
  setwd("/Users/Rahul/Desktop/R_script/gene_exp") 
}
  