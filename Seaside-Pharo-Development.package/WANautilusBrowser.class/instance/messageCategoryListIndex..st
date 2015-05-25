accessing
messageCategoryListIndex: anInteger
	selectedMessageCategory := self messageCategoryList at: anInteger.
	nautilus selectedMethod: nil.
	self changed: #messageCategoryListIndex