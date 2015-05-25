testing
testContentsNotifying
	| model |
	model := WABrowser browserClass new.
	model systemCategoryListIndex: (model systemCategoryList indexOf: 'Seaside-Tests-Pharo-Development').
	model classListIndex: (model classList indexOf: #WABrowserTest).
	model messageCategoryListIndex: (model messageCategoryList indexOf: #'-- all --').
	[ 
		self assert:
			(model contents: 'sampleMethod
			^ 1 + 1'
			notifying: self).
		self assert: message isNil ]
		ensure: [ WABrowserTest removeSelectorSilently: #sampleMethod ]