accessing-readonly
filter
	^ self session filters
		detect: [ :each | each isCometFilter ]
		ifNone: [ self session addFilterFirst: CTFilter new ]