tests - test data
translationLiteralsArrayAsRingDefinition
	"should depend on translationLiteralsArrayAsCompiledMethod"
	|result|
	result := OrderedCollection new.
	self translationLiteralsArrayAsCompiledMethod do: [ :each | | assoc |
		assoc := (each key)->OrderedCollection new.
		(each value) do: [ :method | (assoc value) add: (method asRingDefinition) ].
		assoc value: (assoc value) asArray.
		result add: assoc].
	^ result asArray