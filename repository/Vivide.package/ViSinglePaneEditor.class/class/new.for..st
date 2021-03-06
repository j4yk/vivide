instance creation
new: symbolOrBlockOrScript for: objects

	| instance script pane |
	instance := self new.
	script := symbolOrBlockOrScript asScript.
	pane := ViPane new
		queries: [script organization orderedSteps];
		yourself.
	pane recentQueries add: script.
	pane objects: objects.
	
	pane chooseMostAppropriateQuery.
	"pane currentQuery ifNil: [pane currentQuery: script]."
	  
	instance pane: pane.

	(objects notEmpty and: [objects last isKindOf: ViScriptPart]) ifTrue: [
		ViLoggingService trigger: {#message -> 'Script editor(s) opened.'}].  

	objects do: [:object | ViProfile active ifNotNil: [:profile |
		profile addObject: object]].

	^ instance