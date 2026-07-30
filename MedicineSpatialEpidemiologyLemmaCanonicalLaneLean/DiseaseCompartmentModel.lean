import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure DiseaseCompartmentModel where
  susceptible : Type u
  exposed : Type v
  infectious : Type w
  recovered : Type x
  transitionRates : Prop
  basicReproductionNumber : Prop
  endemicEquilibrium : Prop
  spatialDiffusionCoefficient : Prop

structure DiseaseCompartmentEvidence (M : DiseaseCompartmentModel) where
  transitionRatesClosed : M.transitionRates
  basicReproductionNumberClosed : M.basicReproductionNumber
  endemicEquilibriumClosed : M.endemicEquilibrium
  spatialDiffusionCoefficientClosed : M.spatialDiffusionCoefficient

def DiseaseCompartmentClosed (M : DiseaseCompartmentModel) : Prop :=
  M.transitionRates ∧ M.basicReproductionNumber ∧
  M.endemicEquilibrium ∧ M.spatialDiffusionCoefficient

theorem disease_compartment_closed_from_evidence
    (M : DiseaseCompartmentModel) (E : DiseaseCompartmentEvidence M) :
    DiseaseCompartmentClosed M := by
  exact And.intro E.transitionRatesClosed
    (And.intro E.basicReproductionNumberClosed
      (And.intro E.endemicEquilibriumClosed E.spatialDiffusionCoefficientClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse