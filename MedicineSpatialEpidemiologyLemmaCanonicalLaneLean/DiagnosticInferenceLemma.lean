import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTest where
  name : String
  sensitivity : ℝ
  specificity : ℝ
  cost : ℝ

structure DiseasePrevalence where
  region : SpatialRegion
  prevalence : ℝ

structure DiagnosticInferencePackage where
  tests : List DiagnosticTest
  prevalenceData : List DiseasePrevalence
  testResult : SpatialRegion → ℕ → Bool  -- region, patient index, result
  trueStatus : SpatialRegion → ℕ → Bool
  sampleSize : SpatialRegion → ℕ

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  testsValid : ∀ t ∈ D.tests, t.sensitivity ∈ Set.Icc (0 : ℝ) 1 ∧ t.specificity ∈ Set.Icc (0 : ℝ) 1
  prevalenceValid : ∀ p ∈ D.prevalenceData, p.prevalence ∈ Set.Icc (0 : ℝ) 1
  sampleSizePositive : ∀ r, D.sampleSize r > 0
  testDataConsistent : ∀ r, Finset.card (Finset.filter (λ i => D.testResult r i) (Finset.range (D.sampleSize r))) ≤ D.sampleSize r

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  (∀ t ∈ D.tests, t.sensitivity ∈ Set.Icc (0 : ℝ) 1 ∧ t.specificity ∈ Set.Icc (0 : ℝ) 1) ∧
  (∀ p ∈ D.prevalenceData, p.prevalence ∈ Set.Icc (0 : ℝ) 1) ∧
  (∀ r, D.sampleSize r > 0) ∧
  (∀ r, Finset.card (Finset.filter (λ i => D.testResult r i) (Finset.range (D.sampleSize r))) ≤ D.sampleSize r)

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro (by intro t ht; exact E.testsValid t ht)
    (And.intro (by intro p hp; exact E.prevalenceValid p hp)
      (And.intro E.sampleSizePositive E.testDataConsistent))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse