# swift-witness-observation

This package currently contributes no code of its own: `WitnessObservation` only re-exports `Witnesses` from swift-witnesses, so importing it gives exactly the swift-witnesses API, including the call-observation accessor that its witness macro generates. Until an observation layer lands here, depend on swift-witnesses directly and start from its types; swift-witness-context is a sibling in the same state.
