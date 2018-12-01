"
A configuration for a Seaside application contains attributes which can be used by Seaside and the application. WAConfiguration hierarchy uses the composite pattern.

Subclasses of WASystemConfiguration define and configure related groups of attributes. See WASystemConfiguration class comment for information on defining your own attributes.

WAUserConfiguration is a composite of configurations. The set of configurations contained in WAUserConfiguration is called the ancestors. Attribute values in a configuration override the attribute values in the ancestors. WAUserConfiguration also holds the non-default values of attributes.

Seaside applications start with a WAUserConfiguration (see WAApplication>>configuration) a single parent: WARenderLoopConfiguration. The full ancestry also includes WASessionConfiguration WAGlobalConfiguration. Other configurations can be added to an application on the Seaside configuration page for the application or in your application. Values for the attributes can be given in either location. 

See Seaside documentation (http://www.seaside.st/documentation) on configuration and preferences (http://www.seaside.st/documentation/Configuration%20and%20Preferences) for more information.

Example of setting attributes and adding configurations in code
ASubclassOfWAComponent class>>initialize
	""self initialize""
	| application |
	application := self registerAsApplication: 'GlorpExample'.
	""set a standard attribute""
	application preferenceAt: #sessionClass put: Glorp.WAGlorpSession. 

	""add a configuration""
	application configuration addParent: GlorpConfiguration new.
	application preferenceAt: #databaseLogin put: 'foo'. ""set attribute defined in GlorpConfiguration""

Subclasses must implement the following messages:
	name
		return the name of the configuration

	localValueAt:ifAbsent:
		return the value of the attribute given as first argument
"
Class {
	#name : #WAConfiguration,
	#superclass : #WAObject,
	#instVars : [
		'cachedSearchContexts'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #attributes }
WAConfiguration >> allAttributes [
	| attributes |
	attributes := IdentityDictionary new.
	
	self ancestorsDo: [ :each |
		each localAttributesDo: [ :attr |
			attributes at: attr key put: attr ] ].
	
	^ attributes
]

{ #category : #ancestry }
WAConfiguration >> ancestors [
	"As it happens, the 'seen' set gives us the result we need"
	| set |
	set := IdentitySet new.
	self 
		ancestorsDo:  [ :each | "nothing" ]
		seen: set.
	^ set
]

{ #category : #ancestry }
WAConfiguration >> ancestorsDo: aBlock [ 
	| set |
	set := IdentitySet new.
	self 
		ancestorsDo: aBlock
		seen: set.
	^ set
]

{ #category : #'ancestry-private' }
WAConfiguration >> ancestorsDo: aBlock seen: seenSet [ 
	self parents reverseDo: [ :each | 
		(seenSet includes: each) ifFalse: [
			aBlock value: each.
			seenSet add: each.
			each 
				ancestorsDo: aBlock
				seen: seenSet ] ]
]

{ #category : #values }
WAConfiguration >> at: aSymbol [
	"Retrieves the value of a configuration according to a symbol.
	Checks if the search context resides in the cache, and if not searches for the value according to the configurations ancestry."
	| value context |
	context := self getSearchContextFor: aSymbol.
	
	value := self valueForContext: context.
	
	^ value isNil
		ifTrue: [ context attribute default ]
		ifFalse: [ value ]
]

{ #category : #values }
WAConfiguration >> at: aSymbol ifAbsent: aBlock [
	"Retrieves the value of a configuration according to a symbol.
	Checks if the search context resides in the cache, and if not searches for the value according to the configurations ancestry."
	| value context |
	context := self getSearchContextFor: aSymbol ifAbsent: aBlock.
	
	value := self valueForContext: context.
	
	^ value isNil
		ifTrue: [ context attribute default ]
		ifFalse: [ value ]
]

{ #category : #attributes }
WAConfiguration >> attributeAt: aSymbol [
	^ self attributeAt: aSymbol ifAbsent: [ WAAttributeNotFound signalWithKey: aSymbol ]
]

{ #category : #attributes }
WAConfiguration >> attributeAt: aSymbol ifAbsent: aBlock [
	^ self allAttributes at: aSymbol ifAbsent: aBlock
]

{ #category : #'attributes-private' }
WAConfiguration >> clearSearchContexts [
	cachedSearchContexts := IdentityDictionary new
]

{ #category : #values }
WAConfiguration >> expressionAt: aSymbol ifAbsent: absentBlock [
	self subclassResponsibility
]

{ #category : #values }
WAConfiguration >> expressionAt: aSymbol ifPresent: aBlock [
	| expression |
	expression := self expressionAt: aSymbol ifAbsent: [ ^ nil ].
	^ aBlock value: expression
]

{ #category : #'attributes-private' }
WAConfiguration >> getSearchContextFor: aSymbol [
	"Returns a search context for the given symbol."
	^ self getSearchContextFor: aSymbol ifAbsent: [ WAAttributeNotFound signalWithKey: aSymbol ]
]

{ #category : #'attributes-private' }
WAConfiguration >> getSearchContextFor: aSymbol ifAbsent: aBlock [
	"Returns a search context for the given symbol."
	| context |
	
	context := self
		retrieveSearchContext: aSymbol
		ifAbsentPut: [
			WAAttributeSearchContext key: aSymbol target: self ].
	context attribute isNil ifTrue: [ aBlock value ].
	^ context
]

{ #category : #values }
WAConfiguration >> hasExpressionAt: aSymbol [
	self expressionAt: aSymbol ifAbsent: [ ^ false ].
	^ true
]

{ #category : #'values-private' }
WAConfiguration >> inheritedValueForContext: aContext [
	| value |
	(self parents select: [ :each | aContext isAttributeInheritedOn: each ]) reverseDo: [ :each |
		value := each valueForContext: aContext.
		value notNil ifTrue: [ ^ value ] ].
	
	^ nil
]

{ #category : #ancestry }
WAConfiguration >> inheritsFrom: aConfiguration [
	"Answer whether the given Configuration is a direct or indirect ancestor of this one"
	^ self ancestors includes: aConfiguration
]

{ #category : #testing }
WAConfiguration >> isShared [
	^ false
]

{ #category : #attributes }
WAConfiguration >> localAttributeAt: aSymbol ifAbsent: absentBlock [
	self subclassResponsibility
]

{ #category : #attributes }
WAConfiguration >> localAttributeAt: aSymbol ifPresent: aBlock [
	| value |
	value := self localAttributeAt: aSymbol ifAbsent: [ ^ nil ].
	^ aBlock value: value
]

{ #category : #attributes }
WAConfiguration >> localAttributesDo: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
WAConfiguration >> name [
	^ self class name
]

{ #category : #ancestry }
WAConfiguration >> parents [
	^ #()
]

{ #category : #'attributes-private' }
WAConfiguration >> retrieveSearchContext: aSymbol default: defaultValue [
	"Answer the cached search context. If none found, the defaultValue is returned."
	^ cachedSearchContexts at: aSymbol ifAbsent: [ defaultValue ]
]

{ #category : #'attributes-private' }
WAConfiguration >> retrieveSearchContext: aSymbol ifAbsentPut: aBlock [
	"Answers a search context. If the context resides in the cache, the value from the cache is returned. If not, a new cache entry is created using aBlock."
	| context |
	cachedSearchContexts isNil ifTrue: [
		cachedSearchContexts := IdentityDictionary new ].
	context := cachedSearchContexts at: aSymbol ifAbsentPut: aBlock.
	^ context attribute isNil
		ifTrue: [ cachedSearchContexts at: aSymbol put: aBlock value ]
		ifFalse: [ context ]
]

{ #category : #'values-private' }
WAConfiguration >> valueForContext: aContext [
	aContext at: self ifPresent: [ :v | ^ v ].
	
	self expressionAt: aContext key ifPresent: [ :expression |
		^ aContext
			at: self
			put: (expression determineValueWithContext: aContext configuration: self) ].
	
	(aContext isAttributeLocalOn: self) ifTrue: [ ^ aContext at: self put: nil ].

	^ aContext at: self put: (self inheritedValueForContext: aContext)
]
