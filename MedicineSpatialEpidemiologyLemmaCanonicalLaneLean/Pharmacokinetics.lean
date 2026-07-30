import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticPackage where
  doseMg : ℝ
  volumeDistribution : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  concentrationTimeCourse : ℝ → ℝ
  absorptionModel : Prop
  eliminationModel : Prop
  compartmentStructure : Prop
  absorptionModelTerm : absorptionModel
  eliminationModelTerm : eliminationModel
  compartmentStructureTerm : compartmentStructure

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionModelClosed : P.absorptionModel
  eliminationModelClosed : P.eliminationModel
  compartmentStructureClosed : P.compartmentStructure

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionModel ∧ P.eliminationModel ∧ P.compartmentStructure

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.absorptionModelClosed (And.intro E.eliminationModelClosed E.compartmentStructureClosed)

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse