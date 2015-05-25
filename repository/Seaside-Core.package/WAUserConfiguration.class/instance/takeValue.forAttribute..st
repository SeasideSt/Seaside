values
takeValue: anObject forAttribute: anAttribute
	^ anObject isNil ifFalse: [
		self
			storeExpression:
				((WAValueExpression key: anAttribute key)
					value: anObject;
					yourself)
			forAttribute: anAttribute ]