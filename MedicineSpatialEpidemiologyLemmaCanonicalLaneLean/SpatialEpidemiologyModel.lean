import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SpatialEpidemiologyModel where
  spatialGrid : Type u
  geostatisticalModel : Type v
  arealModel : Type w
  pointPatternModel : Type x
  spatialAutocorrelation : Prop
  clusteringCoefficient : Prop
  adjacencyMatrix : Prop
  diffusionKernel : Prop

structure SpatialEpidemiologyEvidence (S : SpatialEpidemiologyModel) where
  spatialAutocorrelationClosed : S.spatialAutocorrelation
  clusteringCoefficientClosed : S.clusteringCoefficient
  adjacencyMatrixClosed : S.adjacencyMatrix
  diffusionKernelClosed : S.diffusionKernel

def SpatialEpidemiologyClosed (S : SpatialEpidemiologyModel) : Prop :=
  S.spatialAutocorrelation ∧ S.clusteringCoefficient ∧
  S.adjacencyMatrix ∧ S.diffusionKernel

theorem spatial_epidemiology_closed_from_evidence
    (S : SpatialEpidemiologyModel) (E : SpatialEpidemiologyEvidence S) :
    SpatialEpidemiologyClosed S := by
  exact And.intro E.spatialAutocorrelationClosed
    (And.intro E.clusteringCoefficientClosed
      (And.intro E.adjacencyMatrixClosed E.diffusionKernelClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse