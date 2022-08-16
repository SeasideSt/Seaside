accessing
filter
	^ self session filters
		detect: [ :each | each isWebSocketFilter ]
		ifNone: [ self session addFilterFirst: WAWebSocketFilter new ]