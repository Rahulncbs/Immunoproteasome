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

#========Preparing dataframe for the genesets and extracting expression data for a set of genes ##########
getwd()
dat = as.matrix(read_excel("/Users/Rahul/Desktop/v1_copy_4/01_data/immune_and_pathways_gene_list.xlsx"))#, header = TRUE,row.names="X")
x<-c(dat[,1])
geneSets <- list()

check_geneset<-list()
ttd<-list()
for(i in 1:18) {
  geneSets[[x[i]]] <-c(dat[i,4:ncol(dat)])# dat[,i]
  ttd<-append(ttd,c(dat[i,4:ncol(dat)]))
}

x[19]<-"Exhaustive T cell"
geneSets[[x[19]]]<-c("LAG3","HAVCR2","PDCD1")
ttd<-append(ttd,c("LAG3","HAVCR2","PDCD1"))

setwd("/Users/Rahul/Desktop/v1_copy_4/gene_exp")   ### path need to change in docker version
aa<-list.files(path = "/Users/Rahul/Desktop/v1_copy_4/gene_exp",pattern = "csv$") ### path need to change in the docker version

for (i in 1:33) 
{
  cts <- as.matrix(read.csv(aa[i],row.names="Hybridization.REF"))
  #tth=log2(cts+0.01)
  #cts<-tth
  cts1<-cts
  include_list<-c(ttd)
  cts<-subset(cts, rownames(cts) %in% include_list)
  
  check_geneset<-append(check_geneset,list(rownames(cts)))
  
  gsva_es <- gsva(cts, geneSets, mx.diff=1,kcdf="Poisson",method='gsva')
  tt<-strsplit(aa[i],split='_',fixed=TRUE)[[1]][3]
  tt<-strsplit(tt,split='.',fixed=TRUE)[[1]][1]
  
  setwd("/Users/Rahul/Desktop/v1_copy_4/03_output") ## path need to change in the docker version
  write.table(gsva_es, file=paste("GSVA_immune_cells_",tt,".tsv",sep =""), sep="\t")
  setwd("/Users/Rahul/Desktop/v1_copy_4/gene_exp")  ## path need to change in the docker version


  ttd1<-list()
  setwd("/Users/Rahul/Desktop/v1_copy_4/01_data")   
  sample_id_info <- as.matrix(read.csv(paste('final_df_high_low_const_proteosome_uncorrected.csv',sep="")))
  sample_id_info_1<-sample_id_info[sample_id_info[,4]==tt, ]
  design <- cbind(sampleGroup1=1, sampleGroup2vs1=c(rep(0, nrow(sample_id_info_1[sample_id_info_1[,3]=='low', ])), rep(1, nrow(sample_id_info_1[sample_id_info_1[,3]=='high', ]))))
  ttd1<-append(ttd1,c(sample_id_info_1[,1])) #### get the sample id for the particular set of sample group
  
  gsva_es1<-subset(gsva_es, select=unlist(c(ttd1)))  ### get the gsva score for the particular set of sample groups
  tt<-strsplit(aa[i],split='_',fixed=TRUE)[[1]][3]
  tt<-strsplit(tt,split='.',fixed=TRUE)[[1]][1]
  
  adjPvalueCutoff <- 0.001
  logFCcutoff <- log2(2)
  
  #### Differential pathway analysis
  fit <- lmFit(gsva_es1, design)
  fit <- eBayes(fit)

  allGeneSets <- topTable(fit, coef="sampleGroup2vs1", number=Inf)
  DEgeneSets <- topTable(fit, coef="sampleGroup2vs1", number=Inf, p.value=adjPvalueCutoff, adjust="BH")
  res <- decideTests(fit, p.value=adjPvalueCutoff)
  topTable(fit,number=10, coef="sampleGroup2vs1",resort.by="logFC")
  
  setwd("/Users/Rahul/Desktop/v1_copy_4/03_output")
  write.csv(topTable(fit,number=Inf, coef="sampleGroup2vs1",resort.by="logFC"),file=paste('high_low_const_prtoeasome_Diff_immune_score_',tt,".csv",sep=""))
  setwd("/Users/Rahul/Desktop/v1_copy_4/gene_exp")
}