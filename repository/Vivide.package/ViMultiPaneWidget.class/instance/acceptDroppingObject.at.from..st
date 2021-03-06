dropping
acceptDroppingObject: anObject at: aPoint from: source

	| pane |
	pane := ViPane new
		queries: [self organization orderedSteps];
		"Force usage of an identity script because we want to script the objects in a new way."
		in: [:p | p currentQuery: p createIdentityScript];
		objects: anObject asList;
		yourself.

	self assert: pane currentQuery notNil.
	
	[^ self
		acceptDroppingPane: pane
		at: aPoint
		from: source
	] ensure: [
		"Enforce calculation of window bounds before additional window is opened."
		self fullBounds].