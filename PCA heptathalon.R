# Load packages
library(HSAUR)  # Contains heptathlon dataset
library(corrplot)  # For correlation matrix visualization
library(factoextra)  # For enhanced PCA visualizations
library(gridExtra)
# Load the dataset
data("heptathlon")

str(heptathlon)
head(heptathlon)
summary(heptathlon)

# STEP 3: Prepare the data 
hep_data = heptathlon[, 1:7]    # Select only the 7 athletic events, removing score column
hep_data

hep_scaled = scale(hep_data)   # Standardize the data
hep_scaled

# Correlation analysis to check if PCA is appropriate for the data
cor_matrix = cor(hep_data)
round(cor_matrix, 2)           # View correlation matrix (rounded)

# Visualize correlations
corrplot(cor_matrix, method = "color", type = "lower")

# Performing PCA
pca_result = prcomp(hep_scaled, center = FALSE, scale. = FALSE)
pca_result

#summary
summary(pca_result)


# Analyze PCA results
eigenvalues = pca_result$sdev^2

prop_var = eigenvalues / sum(eigenvalues)

cum_var = cumsum(prop_var)

results_table = data.frame(
  Component = paste0("PC", 1:7),
  Eigenvalue = round(eigenvalues, 2),
  Prop_Variance = round(prop_var, 3),
  Cumulative = round(cum_var, 3)
)
results_table

# Loadings and interpretation
loadings = pca_result$rotation
round(loadings[, 1:3], 3)      # Show loadings for first 3 PCs

# Top variables contributing to PC1
sort(abs(loadings[, 1]), decreasing = TRUE)[1:3]

# Top variables contributing to PC2
sort(abs(loadings[, 2]), decreasing = TRUE)[1:3]


# Generate visualizations

# Scree Plot
fviz_eig(pca_result, addlabels = TRUE, 
         title = "Scree Plot - Eigenvalues by Component")

# Biplot showing athletes and variables together
fviz_pca_biplot(pca_result, repel = TRUE,
                title = "PCA Biplot - Individuals and Variables")

# Variable Contributions
fviz_pca_var(pca_result, col.var = "contrib",
             title = "Variable Contributions to PC1 and PC2")
