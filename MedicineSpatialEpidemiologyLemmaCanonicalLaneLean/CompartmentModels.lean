import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  population : ℕ
  susceptible : ℕ
  exposed : ℕ
  infected : ℕ
  recovered : ℕ
  transmissionRate : ℝ
  incubationPeriod : ℝ
  recoveryRate : ℝ
  diseaseInducedMortality : ℝ
  spatialDomain : Type u
  spatialTopology : TopologicalSpace spatialDomain
  diffusionCoefficient : ℝ
  initialConditionsSatisfied : Prop
  spatialHomogeneity : Prop
  wellMixedAssumption : Prop
  initialConditionsSatisfiedTerm : initialConditionsSatisfied
  spatialHomogeneityTerm : spatialHomogeneity
  wellMixedAssumptionTerm : wellMixedAssumption

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  initialConditionsSatisfiedClosed : C.initialConditionsSatisfied
  spatialHomogeneityClosed : C.spatialHomogeneity
  wellMixedAssumptionClosed : C.wellMixedAssumption

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.initialConditionsSatisfied ∧ C.spatialHomogeneity ∧ C.wellMixedAssumption

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.initialConditionsSatisfiedClosed (And.intro E.spatialHomogeneityClosed E.wellMixedAssumptionClosed)

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse