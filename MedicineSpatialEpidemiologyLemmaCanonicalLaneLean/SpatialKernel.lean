import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSpatialEpidemiologyLemmaCanonicalLaneLean

structure SpatialKernel where
  domain : Type
  kernelFunction : domain → domain → ℝ
  symmetry : Prop
  integrability : Prop

structure SpatialKernelEvidence (K : SpatialKernel) where
  symmetryClosed : K.symmetry
  integrabilityClosed : K.integrability

def SpatialKernelClosed (K : SpatialKernel) : Prop :=
  K.symmetry ∧ K.integrability

theorem spatial_kernel_closed_from_evidence (K : SpatialKernel) (E : SpatialKernelEvidence K) :
    SpatialKernelClosed K := by
  exact And.intro E.symmetryClosed E.integrabilityClosed

end MedicineSpatialEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse