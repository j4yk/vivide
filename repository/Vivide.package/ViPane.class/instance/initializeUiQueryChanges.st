initialization
initializeUiQueryChanges

	ViQueryChangeNotifier uniqueInstance
		notify: self
		ofQueryChangesOfItem: ViQueryChangeNotifier stepKind
		change: ModifiedEvent changeKind
		using: #updateFromChangedStep:;
		notify: self
		ofQueryChangesOfItem: ViQueryChangeNotifier stepKind
		change: DoItEvent changeKind
		using: #updateFromQueryEvaluation:.