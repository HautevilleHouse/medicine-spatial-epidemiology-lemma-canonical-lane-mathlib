import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SpatialRegion where
  label : String
  population : ℕ
  area : ℝ

structure CompartmentState where
  susceptible : ℕ
  exposed : ℕ
  infected : ℕ
  recovered : ℕ
  deceased : ℕ

structure SpatialCompartmentModel where
  regions : List SpatialRegion
  initialStates : SpatialRegion → CompartmentState
  transmissionRates : SpatialRegion → ℝ
  recoveryRates : SpatialRegion → ℝ
  mobilityKernel : SpatialRegion → SpatialRegion → ℝ
  quarantineEffectiveness : SpatialRegion → ℝ
  vaccineDistribution : SpatialRegion → ℝ

structure SpatialCompartmentEvidence (M : SpatialCompartmentModel) where
  initialStatesClosed : ∀ r : SpatialRegion, M.initialStates r = M.initialStates r
  ratesPositive : ∀ r, M.transmissionRates r > 0 ∧ M.recoveryRates r > 0
  mobilityKernelNonnegative : ∀ r s, M.mobilityKernel r s ≥ 0
  quarantineEffectivenessValid : ∀ r, M.quarantineEffectiveness r ∈ Set.Icc (0 : ℝ) 1
  vaccineDistributionValid : ∀ r, M.vaccineDistribution r ≥ 0

def SpatialCompartmentClosed (M : SpatialCompartmentModel) : Prop :=
  (∀ r, M.initialStates r = M.initialStates r) ∧
  (∀ r, M.transmissionRates r > 0 ∧ M.recoveryRates r > 0) ∧
  (∀ r s, M.mobilityKernel r s ≥ 0) ∧
  (∀ r, M.quarantineEffectiveness r ∈ Set.Icc (0 : ℝ) 1) ∧
  (∀ r, M.vaccineDistribution r ≥ 0)

theorem spatial_compartment_closed_from_evidence (M : SpatialCompartmentModel) (E : SpatialCompartmentEvidence M) :
    SpatialCompartmentClosed M := by
  exact And.intro E.initialStatesClosed
    (And.intro E.ratesPositive
      (And.intro E.mobilityKernelNonnegative
        (And.intro E.quarantineEffectivenessValid E.vaccineDistributionValid)))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse