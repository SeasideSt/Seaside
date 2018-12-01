"
This class makes attribute searching more efficient by traversing the ancestry once and caching which Configurations hold the attribute. It is then passed through search functions which cache values for the attribute.
"
Class {
	#name : #WAAttributeSearchContext,
	#superclass : #WAObject,
	#instVars : [
		'key',
		'attribute',
		'cachedValues',
		'attributeHolders',
		'attributeInheritors'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #'instance creation' }
WAAttributeSearchContext class >> key: keySymbol target: targetConfiguration [
	^ self basicNew
		initializeWithKey: keySymbol;
		findAttributeAndSelectAncestorsOf: targetConfiguration;
		yourself
]

{ #category : #accessing }
WAAttributeSearchContext >> at: aConfiguration ifPresent: aBlock [
	^ self cachedValues at: aConfiguration ifPresent: aBlock
]

{ #category : #accessing }
WAAttributeSearchContext >> at: aConfiguration put: cachedObject [
	^ self cachedValues at: aConfiguration put: cachedObject
]

{ #category : #accessing }
WAAttributeSearchContext >> attribute [
	^ attribute
]

{ #category : #private }
WAAttributeSearchContext >> cachedValues [
	^ cachedValues
]

{ #category : #private }
WAAttributeSearchContext >> findAttributeAndSelectAncestorsOf: aConfiguration [
	| found |
	(attributeHolders includes: aConfiguration) ifTrue: [ ^ true ].
			
	aConfiguration localAttributeAt: self key ifPresent: [ :attr |
		attribute := attr.
		attributeHolders add: aConfiguration.
		^ true ].
		
	found := false.
	aConfiguration parents do: [ :each |
		found := found | (self findAttributeAndSelectAncestorsOf: each) ].
	
	found ifTrue: [ attributeInheritors add: aConfiguration ].
	
	^ found
]

{ #category : #initialization }
WAAttributeSearchContext >> initializeWithKey: keySymbol [
	self initialize.
	key := keySymbol.
	attributeHolders := Set new.
	attributeInheritors := Set new.
	cachedValues := Dictionary new
]

{ #category : #testing }
WAAttributeSearchContext >> isAttributeFoundOn: aConfiguration [ 
	^ (self isAttributeLocalOn: aConfiguration) or: [ self isAttributeInheritedOn: aConfiguration ]
]

{ #category : #testing }
WAAttributeSearchContext >> isAttributeInheritedOn: aConfiguration [ 
	^ attributeInheritors includes: aConfiguration
]

{ #category : #testing }
WAAttributeSearchContext >> isAttributeLocalOn: aConfiguration [ 
	^ attributeHolders includes: aConfiguration
]

{ #category : #accessing }
WAAttributeSearchContext >> key [
	^ key
]
