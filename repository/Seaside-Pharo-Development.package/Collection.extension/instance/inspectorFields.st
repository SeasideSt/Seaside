*Seaside-Pharo-Development
inspectorFields
	| i |
	i := 0.
	^ self asArray collect: [ :each | i := i + 1. i -> each ]