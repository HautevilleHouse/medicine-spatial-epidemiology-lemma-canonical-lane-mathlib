import MedicineSpatialEpidemiologyLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptible : Type u
  infected : Type v
  recovered : Type w
  population : Prop
  transitionRates : Prop
  diseaseFreeEquilibrium : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  populationClosed : C.population
  transitionRatesClosed : C.transitionRates
  diseaseFreeEquilibriumClosed : C.diseaseFreeEquilibrium

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.population ∧ C.transitionRates ∧ C.diseaseFreeEquilibrium

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.populationClosed (And.intro E.transitionRatesClosed E.diseaseFreeEquilibriumClosed)

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse