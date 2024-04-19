# output, including sessioninfo(), are included as comments at the bottom of this script

# Data
archaeocytes <- c(923, 1947, 3256, 1844)
choanocytes <- c(1455, 566, 307, 623, 92)
cystencytes <- c(1528, 1793, 2465, 1845, 2552)

# Checking normality
shapiro.test(archaeocytes)
shapiro.test(choanocytes)
shapiro.test(cystencytes)

# Checking homogeneity of variances
bartlett.test(list(archaeocytes, choanocytes, cystencytes))


# Combine the data
data <- data.frame(
  Values = c(archaeocytes, choanocytes, cystencytes),
  Group = factor(rep(c("Archaeocytes", "Choanocytes", "Cystencytes"), times = c(4, 5, 5)))
)

# ANOVA
anova_result <- aov(Values ~ Group, data = data)
summary(anova_result)


# Post hoc test for ANOVA
if (summary(anova_result)[[1]][["Pr(>F)"]][1] < 0.05) {
    TukeyHSD(anova_result)
}

sessionInfo()

# > # Data
# > archaeocytes <- c(923, 1947, 3256, 1844)
# > choanocytes <- c(1455, 566, 307, 623, 92)
# > cystencytes <- c(1528, 1793, 2465, 1845, 2552)
# > # Checking normality
# > shapiro.test(archaeocytes)
# 
# 	Shapiro-Wilk normality test
# 
# data:  archaeocytes
# W = 0.94997, p-value = 0.7159
# 
# > shapiro.test(choanocytes)
# 
# 	Shapiro-Wilk normality test
# 
# data:  choanocytes
# W = 0.89632, p-value = 0.3899
# 
# > shapiro.test(cystencytes)
# 
# 	Shapiro-Wilk normality test
# 
# data:  cystencytes
# W = 0.88356, p-value = 0.3258
# 
# > # Checking homogeneity of variances
# > bartlett.test(list(archaeocytes, choanocytes, cystencytes))
# 
# 	Bartlett test of homogeneity of variances
# 
# data:  list(archaeocytes, choanocytes, cystencytes)
# Bartlett's K-squared = 2.1631, df = 2, p-value = 0.3391
# 
# > # Combine the data
# > data <- data.frame(
# +   Values = c(archaeocytes, choanocytes, cystencytes),
# +   Group = factor(rep(c("Archaeocytes", "Choanocytes", "Cystencytes"), times = c(4, 5, 5)))
# + )
# > # ANOVA
# > anova_result <- aov(Values ~ Group, data = data)
# > summary(anova_result)
#             Df  Sum Sq Mean Sq F value  Pr(>F)   
# Group        2 6380149 3190074   7.555 0.00861 **
# Residuals   11 4644527  422230                   
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# > # Post hoc test for ANOVA
# > if (summary(anova_result)[[1]][["Pr(>F)"]][1] < 0.05) {
# +     TukeyHSD(anova_result)
# + }
#   Tukey multiple comparisons of means
#     95% family-wise confidence level
# 
# Fit: aov(formula = Values ~ Group, data = data)
# 
# $Group
#                             diff        lwr       upr     p adj
# Choanocytes-Archaeocytes -1383.9 -2561.1867 -206.6133 0.0221719
# Cystencytes-Archaeocytes    44.1 -1133.1867 1221.3867 0.9943757
# Cystencytes-Choanocytes   1428.0   318.0435 2537.9565 0.0132390
# 
# 
# R version 4.3.2 (2023-10-31)
# Platform: aarch64-apple-darwin20 (64-bit)
# Running under: macOS Ventura 13.5
# 
# Matrix products: default
# BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
# LAPACK: /Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.11.0
# 
# locale:
# [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
# 
# time zone: America/New_York
# tzcode source: internal
#
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] ggplot2_3.5.0
# 
# loaded via a namespace (and not attached):
#   [1] deldir_2.0-4           pbapply_1.7-2          gridExtra_2.3          rlang_1.1.3            magrittr_2.0.3        
#   [6] RcppAnnoy_0.0.22       matrixStats_1.2.0      ggridges_0.5.6         compiler_4.3.2         spatstat.geom_3.2-9   
#  [11] png_0.1-8              vctrs_0.6.5            reshape2_1.4.4         stringr_1.5.1          pkgconfig_2.0.3       
#  [16] fastmap_1.1.1          ellipsis_0.3.2         labeling_0.4.3         utf8_1.2.4             promises_1.2.1        
#  [21] purrr_1.0.2            jsonlite_1.8.8         goftest_1.2-3          later_1.3.2            spatstat.utils_3.0-4  
#  [26] irlba_2.3.5.1          parallel_4.3.2         cluster_2.1.6          R6_2.5.1               ica_1.0-3             
#  [31] stringi_1.8.3          RColorBrewer_1.1-3     spatstat.data_3.0-4    reticulate_1.35.0      parallelly_1.37.1     
#  [36] lmtest_0.9-40          scattermore_1.2        Rcpp_1.0.12            tensor_1.5             future.apply_1.11.1   
#  [41] zoo_1.8-12             sctransform_0.4.1      httpuv_1.6.14          Matrix_1.6-5           splines_4.3.2         
#  [46] igraph_2.0.3           tidyselect_1.2.1       rstudioapi_0.15.0      abind_1.4-5            spatstat.random_3.2-3 
#  [51] codetools_0.2-19       miniUI_0.1.1.1         spatstat.explore_3.2-7 listenv_0.9.1          lattice_0.22-6        
#  [56] tibble_3.2.1           plyr_1.8.9             withr_3.0.0            shiny_1.8.0            ROCR_1.0-11           
#  [61] Rtsne_0.17             future_1.33.1          fastDummies_1.7.3      survival_3.5-8         polyclip_1.10-6       
#  [66] fitdistrplus_1.1-11    pillar_1.9.0           Seurat_5.0.3           KernSmooth_2.23-22     plotly_4.10.4         
#  [71] generics_0.1.3         RcppHNSW_0.6.0         sp_2.1-3               munsell_0.5.0          scales_1.3.0          
#  [76] globals_0.16.3         xtable_1.8-4           glue_1.7.0             lazyeval_0.2.2         tools_4.3.2           
#  [81] data.table_1.15.2      RSpectra_0.16-1        RANN_2.6.1             leiden_0.4.3.1         dotCall64_1.1-1       
#  [86] cowplot_1.1.3          grid_4.3.2             tidyr_1.3.1            colorspace_2.1-0       nlme_3.1-164          
#  [91] patchwork_1.2.0        cli_3.6.2              spatstat.sparse_3.0-3  spam_2.10-0            fansi_1.0.6           
#  [96] viridisLite_0.4.2      dplyr_1.1.4            uwot_0.1.16            gtable_0.3.4           digest_0.6.35         
# [101] progressr_0.14.0       ggrepel_0.9.5          farver_2.1.1           htmlwidgets_1.6.4      SeuratObject_5.0.1    
# [106] htmltools_0.5.7        lifecycle_1.0.4        httr_1.4.7             mime_0.12              MASS_7.3-60.0.1  

