accessing
removals
	^ self currentList select: [ :each | each key = #remove ]