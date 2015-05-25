instance creation
allSubclassesOn: aTargetObject for: aRequestorObject
	| plugins |
	plugins := self allSubclasses
		collect: [ :each | each on: aTargetObject for: aRequestorObject ].
	^ plugins sorted