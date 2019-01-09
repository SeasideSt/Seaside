accessing
messageCategoryListIndex: anInteger
	selectedMessageCategory := self messageCategoryList at: anInteger.
	selectedMethod := nil.
	self changed: #messageCategoryListIndex