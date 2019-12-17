library(CB2)
library(readxl)
sgcount <- read_xls("~/Downloads/41389_2019_145_MOESM3_ESM.xls", skip = 1)

colnames(sgcount)  <- c("sgRNA", "gene", "C1", "T1", "C2", "T2")
design <- data.frame(sample_name = c("C1", "T1", "C2", "T2"),
                     group = c("ctl", "trt", "ctl", "trt"), stringsAsFactors = F)


plot_corr_heatmap(get_CPM(sgcount), design)
plot_count_distribution(get_CPM(sgcount), design)

sg <- measure_sgrna_stats(sgcount, design, "ctl", "trt", ge_id = "gene", sg_id = "sgRNA")
ge <- measure_gene_stats(sg)

ge[ge$fdr_pa<0.1,]

plot_dotplot(get_CPM(sgcount), design, gene = "ERBB2", ge_id ="gene", sg_id = "sgRNA")

plot_dotplot(get_CPM(sgcount), design, gene = "ILK", ge_id ="gene", sg_id = "sgRNA")

plot_dotplot(get_CPM(sgcount), design, gene = "WEE1", ge_id ="gene", sg_id = "sgRNA")

plot_dotplot(get_CPM(sgcount), design, gene = "LMTK3", ge_id ="gene", sg_id = "sgRNA")
