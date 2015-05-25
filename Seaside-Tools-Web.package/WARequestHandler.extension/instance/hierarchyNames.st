*seaside-tools-web
hierarchyNames
	self isRoot ifTrue: [ ^ #() ].
	^ self parent hierarchyNames copyWith: self name