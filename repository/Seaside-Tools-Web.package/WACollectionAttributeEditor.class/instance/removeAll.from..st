private
removeAll: aRemoveCollection from: aCollection
	^ aCollection reject: [ :each |
		aRemoveCollection includes: each ]