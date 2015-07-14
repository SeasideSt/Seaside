values
at: aSymbol addAll: additions removeAll: removals
	self addExpression: ((WAAddRemoveExpression key: aSymbol)
			additions: additions;
			removals: removals;
			yourself)