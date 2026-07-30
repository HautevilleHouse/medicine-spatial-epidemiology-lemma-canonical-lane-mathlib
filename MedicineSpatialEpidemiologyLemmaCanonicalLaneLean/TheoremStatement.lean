import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure MedicineSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MedicineAdmittedObject where
  space : MedicineSpace
  compartmentModel : Prop
  spatialContinuum : Prop
  observable : Type
  observableTopology : TopologicalSpace observable
  fittedToData : Prop
  conclusion : fittedToData

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.fittedToData

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse