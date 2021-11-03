version 1.0

import "modules/BayesSpace.wdl" as module

workflow BayesSpace {

    input {
        String sampleName
        File spatial
        File filteredFeatureBarcodeMatrix
        Int numClusters
        Int numHvg
        Int numPca

        # docker-related
        String dockerRegistry
    }

    call module.BayesSpace {
        input:
            sampleName = sampleName,
            spatial = spatial,
            filteredFeatureBarcodeMatrix = filteredFeatureBarcodeMatrix,
            numClusters = numClusters,
            numHvg = numHvg,
            numPca = numPca,
            dockerRegistry = dockerRegistry
    }

    output {
        File knee = BayesSpace.knee
        File cluster = BayesSpace.cluster
        File clusterEnhanced = BayesSpace.clusterEnhanced
        File adata = BayesSpace.adata
        File csvEnhanced = BayesSpace.csvEnhanced
        File rds = BayesSpace.rds
        File rdsEnhanced = BayesSpace.rdsEnhanced
    }
}
