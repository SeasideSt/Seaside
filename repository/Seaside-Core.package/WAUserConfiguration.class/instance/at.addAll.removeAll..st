values
at: aSymbol addAll: additions removeAll: removals
	^ self
		storeExpression:
			((WAAddRemoveExpression key: aSymbol)
				additions: additions;
				removals: removals;
				yourself)
		forAttribute: (self attributeAt: aSymbol)