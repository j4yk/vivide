support - debugging
interpretUpToDetect: block

	| input |
	input := self input. "We need to call this here because we need to have updated context."

	otherSteps overlappingPairsDo: [:s1 :s2 |
		s1 next == s2 ifFalse: [
			self warningSent: 'Some steps are not connected. Fix that first.'.
			^ nil]].
		
	^ (ViQueryInterpreter on: (ViQueryStep use: input in: otherSteps first))
		upToDetect: block;
		yourself