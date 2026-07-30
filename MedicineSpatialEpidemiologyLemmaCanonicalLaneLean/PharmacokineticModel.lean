import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : Type u
  distributionVolume : Type v
  eliminationRate : Type w
  doseRegimen : Prop
  steadyStateConcentration : Prop
  clearance : Prop
  halfLife : Prop

structure PharmacokineticEvidence (P : PharmacokineticModel) where
  doseRegimenClosed : P.doseRegimen
  steadyStateConcentrationClosed : P.steadyStateConcentration
  clearanceClosed : P.clearance
  halfLifeClosed : P.halfLife

def PharmacokineticClosed (P : PharmacokineticModel) : Prop :=
  P.doseRegimen ∧ P.steadyStateConcentration ∧
  P.clearance ∧ P.halfLife

theorem pharmacokinetic_closed_from_evidence
    (P : PharmacokineticModel) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.doseRegimenClosed
    (And.intro E.steadyStateConcentrationClosed
      (And.intro E.clearanceClosed E.halfLifeClosed))

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse