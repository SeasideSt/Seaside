testing
isAbstract
	"True if the attribute is locally defined and there is no default"
	^ self isLocal and: [ self default isNil ]