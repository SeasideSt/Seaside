Deprecation activateTransformations: false.
(Smalltalk hasClassNamed: 'GtImageSetup') ifTrue: [
	{ Dictionary. OrderedDictionary. SequenceableCollection } do: [ :class |
		(class includesSelector: #asJson) ifTrue: [
			class removeSelector: #asJson ] ] ].
