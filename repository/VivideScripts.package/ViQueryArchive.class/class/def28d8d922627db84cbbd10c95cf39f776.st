definitions
def28d8d922627db84cbbd10c95cf39f776
	<definition>

	^ ((Dictionary new) add: (#class->ViQueryStepDefinition); add: (#properties->((Dictionary new) add: (#creationAuthor->'mt'); add: (#creationTimeStamp->'9 December 2015 11:26:37 am'); yourself)); add: (#id->#'28d8d922-627d-b84c-bbd1-0c95cf39f776'); add: (#block->[:in :out | ([:all | all collect: [:o | (
	[:node | 
{ #text
		-> (node isMessage
				ifTrue: [node selector]).
	#icon
		-> (node isMessage
				ifTrue: [UiDiagonaIcons icon0127Small]
				ifFalse: [node isReturn
						ifTrue: [UiDiagonaIcons icon0316Small]
						ifFalse: [ViIcons blankIcon]]) }]
		value: o), { #object -> o }]]
			value: in) do: [:result | out add: result]]); add: (#sourceCode->'[:in :out | ([:all | all collect: [:o | (
	[:node | 
{ #text
		-> (node isMessage
				ifTrue: [node selector]).
	#icon
		-> (node isMessage
				ifTrue: [UiDiagonaIcons icon0127Small]
				ifFalse: [node isReturn
						ifTrue: [UiDiagonaIcons icon0316Small]
						ifFalse: [ViIcons blankIcon]]) }]
		value: o), { #object -> o }]]
			value: in) do: [:result | out add: result]]'); yourself)