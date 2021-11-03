version 1.0

import "modules/Cluster.wdl" as module

workflow Cluster {

    input {
        String sampleName
        File secondaryAnalysis
    }

    call module.GetGraphCluster {
        input:
            sampleName = sampleName,
            secondaryAnalysis = secondaryAnalysis
    }

    call module.GetNumGraphClusters {
        input:
            graphclust = GetGraphCluster.graphclust
    }

    output {
        Int numClusters = GetNumGraphClusters.numClusters
    }
}
