import Testing

import WitnessObservation

@Suite
struct `Witness Observation Tests` {
  @Suite struct Unit {}
}

extension `Witness Observation Tests`.Unit {
  @Test
  func `reexports Witnesses`() {
    #expect(String(reflecting: Witness.self) == "Witness_Primitives.Witness")
  }
}
