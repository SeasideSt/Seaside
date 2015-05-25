instance creation
allSubclassesFor: aRequestorObject
	| plugins |
	plugins := self allSubclasses
		collect: [ :each | each for: aRequestorObject ].
	^ plugins sorted