import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SpatialEpidemiologyPackage where
  geographicalGrid : Type u
  gridTopology : TopologicalSpace geographicalGrid
  infectionKernel : ℝ → ℝ
  mobilityMatrix : ℝ → ℝ → ℝ
  patchReproductionNumber : ℝ
  basicReproductionNumber : ℝ
  kernelIntegrated : Prop
  mobilityConsistent : Prop
  globalSpreadCondition : Prop
  kernelIntegratedTerm : kernelIntegrated
  mobilityConsistentTerm : mobilityConsistent
  globalSpreadConditionTerm : globalSpreadCondition

structure SpatialEpidemiologyEvidence (S : SpatialEpidemiologyPackage) where
  kernelIntegratedClosed : S.kernelIntegrated
  mobilityConsistentClosed : S.mobilityConsistent
  globalSpreadConditionClosed : S.globalSpreadCondition

def SpatialEpidemiologyClosed (S : SpatialEpidemiologyPackage) : Prop :=
  S.kernelIntegrated ∧ S.mobilityConsistent ∧ S.globalSpreadCondition

theorem spatial_epidemiology_closed_from_evidence (S : SpatialEpidemiologyPackage) (E : SpatialEpidemiologyEvidence S) : SpatialEpidemiologyClosed S := by
  exact And.intro E.kernelIntegratedClosed (And.intro E.mobilityConsistentClosed E.globalSpreadConditionClosed)

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse