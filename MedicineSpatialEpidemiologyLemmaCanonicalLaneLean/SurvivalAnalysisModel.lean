import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SurvivalAnalysisModel where
  hazardFunction : Type u
  survivalFunction : Type v
  censoringMechanism : Type w
  coxProportionalHazards : Prop
  kaplanMeierEstimator : Prop
  logRankTest : Prop
  acceleratedFailureTimeModel : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisModel) where
  coxProportionalHazardsClosed : S.coxProportionalHazards
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  logRankTestClosed : S.logRankTest
  acceleratedFailureTimeModelClosed : S.acceleratedFailureTimeModel

def SurvivalAnalysisClosed (S : SurvivalAnalysisModel) : Prop :=
  S.coxProportionalHazards ∧ S.kaplanMeierEstimator ∧
  S.logRankTest ∧ S.acceleratedFailureTimeModel

theorem survival_analysis_closed_from_evidence
    (S : SurvivalAnalysisModel) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.coxProportionalHazardsClosed
    (And.intro E.kaplanMeierEstimatorClosed
      (And.intro E.logRankTestClosed E.acceleratedFailureTimeModelClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse