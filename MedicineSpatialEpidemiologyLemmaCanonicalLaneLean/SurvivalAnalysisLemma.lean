import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SurvivalData where
  patientId : ℕ
  time : ℝ
  event : Bool  -- true if event occurred, false if censored
  covariates : List ℝ
  region : SpatialRegion

structure SurvivalModel where
  baselineHazard : ℝ → ℝ
  covariateEffects : List ℝ
  proportionalHazard : Bool
  timeVaryingCovariates : Bool
  spatialRandomEffect : SpatialRegion → ℝ

structure SurvivalAnalysisPackage where
  data : List SurvivalData
  model : SurvivalModel
  logLikelihood : ℝ
  estimatedParameters : List ℝ
  confidenceIntervals : List (ℝ × ℝ)
  pValues : List ℝ

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  dataNonempty : S.data ≠ []
  baselineHazardPositive : ∀ t > 0, S.model.baselineHazard t > 0
  covariateEffectsNonNull : S.model.covariateEffects ≠ []
  logLikelihoodComputed : True
  estimatedParametersValid : S.estimatedParameters.length = S.model.covariateEffects.length + 1
  confidenceIntervalsValid : ∀ (ci : ℝ × ℝ) ∈ S.confidenceIntervals, ci.1 ≤ ci.2

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  (S.data ≠ []) ∧
  (∀ t > 0, S.model.baselineHazard t > 0) ∧
  (S.model.covariateEffects ≠ []) ∧
  (S.estimatedParameters.length = S.model.covariateEffects.length + 1) ∧
  (∀ (ci : ℝ × ℝ) ∈ S.confidenceIntervals, ci.1 ≤ ci.2)

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.dataNonempty
    (And.intro E.baselineHazardPositive
      (And.intro E.covariateEffectsNonNull
        (And.intro E.estimatedParametersValid E.confidenceIntervalsValid)))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse