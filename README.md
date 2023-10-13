### 🌎 Single-cell Multiomics &nbsp; &nbsp; &nbsp; 🔍 Benchmarking &nbsp; &nbsp; &nbsp; 📈 Machine Learning

Single-cell sequencing technologies allow quantification of cellular heterogeneity, but sequencing individual modalities describes only one layer of the processes that regulate cellular function (Heumos et al. 2023). To determine a more comprehensive picture of cellular function, single-cells can be sequenced as paired modalities – for example, obtaining chromatin accessibility peaks and gene expression counts for individual cells. However, experimentally generating paired modalities is limited by complexity, cost and noise (Wu et al. 2021). 

To overcome the limitations of experimentally generating multi-modal data sets, machine learning approaches have been developed to computationally derive paired modalities (Lance et al. 2022). By training on small multi-modal data sets – which are more feasible to obtain – these cross-modality approaches learn the biological relationships between paired modalities rather than incorporating prior assumptions (Hao et al. 2022). However, the low-dimensional latent space that represents these biological relationships is not interpretable (Hao et al. 2022). Despite the potential applications for computationally pairing single-modal data sets, cross-modality approaches are not adequately benchmarked due to their recent innovation.

**Research Question:** *How successful is MultiVI at integrating artificially unpaired gene expression and chromatin accessibility data?*

![MultiVI](https://github.com/kbfeldmann/benchmark-autoencoder/assets/47021794/2cfc5808-eb14-4cfd-87c8-4879ba9483fc)
**Figure 1:** MultiVI is a variational autoencoder that uses neural networks to pair gene expression and chromatin accessibility modalities (Ashuach et al. 2021). Modality-specific encoders learn biological relationships from the paired modalities, and modality-specific decoders sample from the low-dimensional latent space to integrate single-modalities or impute missing modalities.

We found that MultiVI is better at integrating single-modalities when using the gene expression neighborhood, potentially because expression counts are more variable and provide more information than accessibility peaks. Additionally, as expected with machine learning models, MultiVI performed better when trained with more paired information. Finally, performance varies by cell type where cell types with many cells are likely to integrate similar cells.

To learn more, check out my poster for early-career molecular biologists: [click here](Spring_Rotation_Poster.pdf)

## Benchmarking with Ground Truth Pairings

![Bioinformatics Pipeline](https://github.com/kbfeldmann/benchmark-autoencoder/assets/47021794/771a478a-6477-446e-aba5-41ccab52d69d)
**Figure 2:** To benchmark MultiVI, I divided a multimodal dataset into training and testing subsets, and removed modalities from the testing subsets. MultiVI was trained on paired modalities to learn the biological relationships between modalities. Integrated unpaired modalities from the testing subsets were compared to the ground truth matches to access model performance.

Below is a brief description for each of the experiments run. More details can be found in each notebook.

```
# Visualize the relationships between cell types using a UMAP for the two single-cell datasets. 
bone-marrow_latent_space.ipynb
cd34_latent_space.ipynb

# Train MultiVI on 70% of cells. Duplicate 30% of cells and remove one modality. Integrate remaining modalities and compare to ground truth.
bone-marrow.70-30_celltype.ipynb
cd34.70-30_celltype.ipynb

# Train MultiVI on 30% of cells. Duplicate 70% of cells and remove one modality. Integrate remaining modalities and compare to ground truth.
bone-marrow.30-70_celltype.ipynb

# Train MultiVI on 60% of cells. Remove one modality from each set of 20% of cells and integrate.
bone-marrow.60-20-20_celltype.ipynb

# Train MultiVI on 20% of cells. Remove one modality from each set of 40% of cells and integrate.
bone-marrow.20-40-40_celltype.ipynb

# Train MultiVI on all cells from one dataset. Unpair modalities from second dataset and integrate.
bone-marrow.100-cd34.100_celltype.ipynb
```
