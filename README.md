### 🌎 Single-cell Multiomics &nbsp; &nbsp; &nbsp; 🔍 Benchmarking &nbsp; &nbsp; &nbsp; 📈 Machine Learning

Single-cell sequencing technologies allow quantification of cellular heterogeneity, but sequencing individual modalities describes only one layer of the processes that regulate cellular function (Heumos et al. 2023). To determine a more comprehensive picture of cellular function, single-cells can be sequenced as paired modalities – for example, obtaining chromatin accessibility peaks and gene expression counts for individual cells. However, experimentally generating paired modalities is limited by complexity, cost and noise (Wu et al. 2021). 

To overcome the limitations of experimentally generating multi-modal data sets, machine learning approaches have been developed to computationally derive paired modalities (Lance et al. 2022). By training on small multi-modal data sets – which are more feasible to obtain – these cross-modality approaches learn the biological relationships between paired modalities rather than incorporating prior assumptions (Hao et al. 2022). However, the low-dimensional latent space that represents these biological relationships is not interpretable (Hao et al. 2022). Despite the potential applications for computationally pairing single-modal data sets, cross-modality approaches are not adequately benchmarked due to their recent innovation.

**Research Question:** *How successful is MultiVI at integrating artificially unpaired gene expression and chromatin accessibility data?*

**-----Insert photo of MultiVI-----**

**Figure 1:** MultiVI is a variational autoencoder that uses neural networks to pair gene expression and chromatin accessibility modalities (Ashuach et al. 2021). Modality-specific encoders learn biological relationships from the paired modalities, and modality-specific decoders sample from the low-dimensional latent space to integrate single-modalities or impute missing modalities.

We found that MultiVI is better at integrating single-modalities when using the gene expression neighborhood, potentially because expression counts are more variable and provide more information than accessibility peaks. Additionally, as expected with machine learning models, MultiVI performed better when trained with more paired information. Finally, performance varies by cell type where cell types with many cells are likely to integrate similar cells.

To learn more, check out my poster for early-career molecular biologists: [click here](Spring_Rotation_Poster.pdf)

## Benchmarking Methods

**-----Insert figure-----**
