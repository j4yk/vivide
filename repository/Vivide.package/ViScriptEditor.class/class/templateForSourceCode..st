templates - support
templateForSourceCode: code
	"Guess the underlying script template given the code."

	| node template properties tmp |
	properties := Dictionary new.
	template := self templateStandard.
	node := RBParser
		parseExpression: code
		onError: [:msg :idx | ^ template -> properties].

	(node sentMessages anySatisfy: [:msg |
		#(collect: select: gather: reject: reduce: inject: asGroups sort: sorted: sorted sortBy:) anySatisfy: [:verb |  
			msg beginsWith: verb]]) ifTrue: [
			template := self templateAllAtOnce].
	
	node isBlock ifTrue: [
		node arguments size = 0 ifTrue: [template := self templateGlobal].
		node arguments size > 1 ifTrue: [
			template := self templateTuples.
			properties at: #inputKind put: (Array new: node arguments size)].

		(node allChildren anySatisfy: [:child |
			tmp := child.
			((child isMessage
				and: [child selector = #->])
				and: [child receiver isLiteral])
				"and: [#(text icon color morph icon) includes: child receiver value]"])
					ifTrue: [ "So we have an association with suspicious keys..."
						"properties at: #modelClass put: ViQueryNode." "Skip default?"
						properties at: #isProperty put: true.
						
						node arguments size = 0
							ifTrue: [template := self templateWrapper]
							ifFalse: [template := node arguments size = 1
								ifTrue: [(code includesSubstring: '#object' caseSensitive: true)
									ifTrue: [self templatePropertiesWithObject]
									ifFalse: [self templateProperties]]
								ifFalse: [(code includesSubstring: '#object' caseSensitive: true)
									ifTrue: [self templateTuplesPropertiesWithoutObject]
									ifFalse: [self templateTuplesProperties]]]].  
	].

	(node isMessage and: [node selector = #->]) ifTrue: [
		template := nil -> ''.
		"Full block in script properties detected!"
		(Compiler evaluate: code) value do: [:assoc |
			properties at: assoc key put: assoc value].
		
		self flag: #todo. "mt: Detect script references."].

	^ template -> properties