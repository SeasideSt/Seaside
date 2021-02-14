"
I hold a collection of attributes and present methods to construct new methods, providing an interface a bit like WACanvas and #renderContentOn: to WASystemConfiguration>>addAttributes:.

I can use any kind of collection class and handle setting the #configuration: parameter of the attribute appropriately on addition. If my collection is a Dictionary, I will store the attributes by their keys.

"
Class {
	#name : #WAConfigurationDescription,
	#superclass : #WAObject,
	#instVars : [
		'attributes',
		'expressions'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #private }
WAConfigurationDescription >> add: aDescriptor to: aDictionary [
	^ aDictionary at: aDescriptor key put: aDescriptor
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> addAttribute: anAttribute [
	^ self add: anAttribute to: attributes
]

{ #category : #values }
WAConfigurationDescription >> addExpression: anExpression [
	^ self add: anExpression to: expressions
]

{ #category : #values }
WAConfigurationDescription >> at: aSymbol addAll: aCollection [
	self at: aSymbol addAll: aCollection removeAll: #()
]

{ #category : #values }
WAConfigurationDescription >> at: aSymbol addAll: additions removeAll: removals [
	self addExpression: ((WAAddRemoveExpression key: aSymbol)
			additions: additions;
			removals: removals;
			yourself)
]

{ #category : #values }
WAConfigurationDescription >> at: aSymbol put: anObject [ 
	self addExpression: ((WAValueExpression key: aSymbol)
			value: anObject;
			yourself)
]

{ #category : #values }
WAConfigurationDescription >> at: aSymbol putClass: aClass [ 
	self at: aSymbol put: (GRPlatform current bindingOf: aClass)
]

{ #category : #accessing }
WAConfigurationDescription >> attributes [
	^ attributes
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> boolean: aSymbol [
	^ self addAttribute: (WABooleanAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> classBinding: aSymbol [
	^ self addAttribute: (WAClassBindingAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> classBindingCollection: aSymbol [
	^ self addAttribute: (WAClassBindingCollectionAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> collection: aSymbol [
	^ self addAttribute: (WACollectionAttribute key: aSymbol)
]

{ #category : #accessing }
WAConfigurationDescription >> expressions [
	^ expressions
]

{ #category : #initialization }
WAConfigurationDescription >> initialize [
	super initialize.
	attributes := IdentityDictionary new.
	expressions := IdentityDictionary new
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> integer: aSymbol [
	^ self addAttribute: (WAIntegerAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> list: aSymbol [
	^ self addAttribute: (WAListAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> listOfClasses: aSymbol [
	^ self addAttribute: (WAClassListAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> number: aSymbol [
	^ self addAttribute: (WANumberAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> password: aSymbol [
	^ self addAttribute: (WAPasswordAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> string: aSymbol [
	^ self addAttribute: (WAStringAttribute key: aSymbol)
]

{ #category : #'attribute creation' }
WAConfigurationDescription >> url: aSymbol [
	^ self addAttribute: (WAUrlAttribute key: aSymbol)
]
