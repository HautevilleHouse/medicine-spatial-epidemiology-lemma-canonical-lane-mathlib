import MedicineSpatialEpidemiologyLemmaCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SpatialEpidemiologyLemmaPackage {C : CompartmentModelPackage}
    {P : PharmacokineticModelPackage C} {D : DiagnosticInferencePackage C P}
    {S : SurvivalAnalysisPackage C P D} where
  spatialSpreadDynamics : Prop
  interventionEffectiveness : Prop
  herdImmunityThreshold : Prop
  endemicEquilibrium : Prop

structure SpatialEpidemiologyLemmaEvidence {C : CompartmentModelPackage}
    {P : PharmacokineticModelPackage C} {D : DiagnosticInferencePackage C P}
    {S : SurvivalAnalysisPackage C P D}
    (E : SpatialEpidemiologyLemmaPackage C P D S) where
  spatialSpreadDynamicsClosed : E.spatialSpreadDynamics
  interventionEffectivenessClosed : E.interventionEffectiveness
  herdImmunityThresholdClosed : E.herdImmunityThreshold
  endemicEquilibriumClosed : E.endemicEquilibrium

def SpatialEpidemiologyLemmaClosed {C : CompartmentModelPackage}
    {P : PharmacokineticModelPackage C} {D : DiagnosticInferencePackage C P}
    {S : SurvivalAnalysisPackage C P D}
    (E : SpatialEpidemiologyLemmaPackage C P D S) : Prop :=
  E.spatialSpreadDynamics ∧ E.interventionEffectiveness ∧
  E.herdImmunityThreshold ∧ E.endemicEquilibrium

theorem spatial_epidemiology_lemma_closed_from_evidence {C : CompartmentModelPackage}
    {P : PharmacokineticModelPackage C} {D : DiagnosticInferencePackage C P}
    {S : SurvivalAnalysisPackage C P D}
    (E : SpatialEpidemiologyLemmaPackage C P D S)
    (Ev : SpatialEpidemiologyLemmaEvidence E) : SpatialEpidemiologyLemmaClosed E := by
  exact And.intro Ev.spatialSpreadDynamicsClosed
    (And.intro Ev.interventionEffectivenessClosed
      (And.intro Ev.herdImmunityThresholdClosed Ev.endemicEquilibriumClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse