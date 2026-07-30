import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticInferencePackage where
  testSensitivity : ℝ
  testSpecificity : ℝ
  diseasePrevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  bayesianUpdating : Prop
  likelihoodRatio : Prop
  prevalenceCalibrated : Prop
  bayesianUpdatingTerm : bayesianUpdating
  likelihoodRatioTerm : likelihoodRatio
  prevalenceCalibratedTerm : prevalenceCalibrated

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  bayesianUpdatingClosed : D.bayesianUpdating
  likelihoodRatioClosed : D.likelihoodRatio
  prevalenceCalibratedClosed : D.prevalenceCalibrated

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.bayesianUpdating ∧ D.likelihoodRatio ∧ D.prevalenceCalibrated

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.bayesianUpdatingClosed (And.intro E.likelihoodRatioClosed E.prevalenceCalibratedClosed)

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse