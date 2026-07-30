import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure DiagnosticTestAccuracy where
  sensitivity : Type u
  specificity : Type v
  positivePredictiveValue : Type w
  negativePredictiveValue : Type x
  likelihoodRatioPositive : Prop
  likelihoodRatioNegative : Prop
  cutOffThreshold : Prop
  rocCurve : Prop

structure DiagnosticAccuracyEvidence (D : DiagnosticTestAccuracy) where
  likelihoodRatioPositiveClosed : D.likelihoodRatioPositive
  likelihoodRatioNegativeClosed : D.likelihoodRatioNegative
  cutOffThresholdClosed : D.cutOffThreshold
  rocCurveClosed : D.rocCurve

def DiagnosticAccuracyClosed (D : DiagnosticTestAccuracy) : Prop :=
  D.likelihoodRatioPositive ∧ D.likelihoodRatioNegative ∧
  D.cutOffThreshold ∧ D.rocCurve

theorem diagnostic_accuracy_closed_from_evidence
    (D : DiagnosticTestAccuracy) (E : DiagnosticAccuracyEvidence D) :
    DiagnosticAccuracyClosed D := by
  exact And.intro E.likelihoodRatioPositiveClosed
    (And.intro E.likelihoodRatioNegativeClosed
      (And.intro E.cutOffThresholdClosed E.rocCurveClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse