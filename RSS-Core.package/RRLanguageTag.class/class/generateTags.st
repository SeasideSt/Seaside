generating
generateTags
	^ self codes do: [ :each | self generateFor: each ]