"
You should subclass WASystemConfiguration to define new attributes. The method #describeOn: is passed an instance of WAConfigurationDescription which can be used to create new attributes. The attributes can be configured to specify their default value, label, and so on. See the methods on WAAttribute and its subclasses to see what options are available.

If a configuration needs to override the value of another WASystemConfiguration or depends on its attributes, implement the method ""parents"", returning a collection of configuration objects.

WASystemConfiguration subclasses are ""read-only"" in that their attributes, parents, and default values are all specified in code. Users and applications that want to configure values for attributes should create a WAUserConfiguration and specify the WASystemConfiguration in its ancestry.

WASystemConfiguration classes are singleton. You should use #instance on the class side to get the current instance. You cannot call #copy on a WASystemConfiguration.

Subclasses should implement the following messages:
	describeOn:
		
They may also want to implement:
	parents
"
Class {
	#name : #WASystemConfiguration,
	#superclass : #WAConfiguration,
	#instVars : [
		'description'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #actions }
WASystemConfiguration class >> clearAllDescriptions [
	self allSubclasses do: [ :each | each instance clearDescription ]
]

{ #category : #'class initialization' }
WASystemConfiguration class >> initialize [
	"Work around for Issue 643
	http://code.google.com/p/seaside/issues/detail?id=643"
	self clearAllDescriptions
]

{ #category : #accessing }
WASystemConfiguration class >> instance [
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : #'instance creation' }
WASystemConfiguration class >> new [
	^ self error: 'SystemConfigurations are singletons. Use #instance.'
]

{ #category : #private }
WASystemConfiguration >> attributes [
	^ self description attributes
]

{ #category : #description }
WASystemConfiguration >> buildDescription [
	| d |
	d := WAConfigurationDescription new.
	self describeOn: d.
	^ description := d
]

{ #category : #description }
WASystemConfiguration >> clearDescription [
	description := nil.
	self clearSearchContexts
]

{ #category : #copying }
WASystemConfiguration >> copy [
	^ self error: 'SystemConfigurations are singletons and should not be copied.'
]

{ #category : #description }
WASystemConfiguration >> describeOn: conf [
	"Should be implemented by subclasses to add attributes and value overrides to the configuration"
]

{ #category : #private }
WASystemConfiguration >> description [
	^ description isNil 
		ifFalse: [ description ]
		ifTrue: [ self buildDescription ]
]

{ #category : #values }
WASystemConfiguration >> expressionAt: aSymbol ifAbsent: absentBlock [
	^ self description expressions at: aSymbol ifAbsent: absentBlock
]

{ #category : #attributes }
WASystemConfiguration >> localAttributeAt: aSymbol ifAbsent: absentBlock [
	^ self attributes at: aSymbol ifAbsent: absentBlock
]

{ #category : #attributes }
WASystemConfiguration >> localAttributesDo: aBlock [
	self attributes do: aBlock
]
