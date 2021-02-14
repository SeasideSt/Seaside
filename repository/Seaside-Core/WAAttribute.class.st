"
A WAAttribute represents a value of a specified type in a Seaside configuration. Some attributes are needed by Seaside for application parameters like deployment Mode and session timeout. Optional attributes like a database login may be used internally by the application.

Each subclass of WAAttribute handles one type (Number, Boolean, etc) of attribute. The ""group"" of the attribute is used to place all attributes in the same group together on the Seaside configuration page. The ""key"" of the attribute identifies the attribute. Attribute keys must be globally unique so use namespacing where required to ensure uniqueness. See WAConfiguration for example of accessing a configuration attribute. 

Subclasses may implement their own configuration options depending on their needs.

Subclasses must implement the following messages:
	valueFromString: aString
		convert ""aString"" into type represented by the class, return result of the conversion
	
	accept: aVisitor with: anObject
		Typical implementation is:
			aVisitor visitXXXAttribute: self with: anObject

		where XXX is the type of this attribute. The method visitXXXAttribute:with: must be implemented in all visitors, in particular WAUserConfigurationEditorVisitor which creates the configuration page for Seaside applications.

Instance Variables:
	configuration	<WAConfiguration>	The configuration object that defined the attribute
	group			<Symbol>				name of the group the attribute belongs to
	key				<Symbol>				key or name of the attribute, used to look up the attribute
	comment		<String> 				a full length description of the attribute for displaying in the configuration interface
	label			<String>				a short field label used in the user interface. If not specified, a label is constructed from the key.
	default			<Object>				The default value for the attribute.
"
Class {
	#name : #WAAttribute,
	#superclass : #WAConfigurationElement,
	#instVars : [
		'group',
		'comment',
		'label',
		'default',
		'advanced'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAAttribute >> accept: aVisitor [
	aVisitor visitAttribute: self
]

{ #category : #actions }
WAAttribute >> beAdvanced [
	advanced := true
]

{ #category : #accessing }
WAAttribute >> comment [
	"Answer a comment or help text of the receiving attribute."

	^ comment
]

{ #category : #accessing }
WAAttribute >> comment: aString [
	comment := aString
]

{ #category : #accessing }
WAAttribute >> default [
	"Answer a default value for the receiving attribute."

	^ default
]

{ #category : #accessing }
WAAttribute >> default: anObject [
	default := anObject
]

{ #category : #accessing }
WAAttribute >> group [
	"Answer the group of the receiving attribute."
	
	^ group ifNil: [ #general ]
]

{ #category : #accessing }
WAAttribute >> group: aSymbol [
	group := aSymbol
]

{ #category : #initialization }
WAAttribute >> initializeWithKey: aSymbol [
	super initializeWithKey: aSymbol.
	advanced := false
]

{ #category : #testing }
WAAttribute >> isAdvanced [
	"Answer whether this is an advanced option and should be hidden by default in the configuration editor so as not to overwhelm new users."

	^ advanced
]

{ #category : #testing }
WAAttribute >> isCollectionAttribute [
	^ false
]

{ #category : #accessing }
WAAttribute >> label [
	"Answer the label of the receiving attribute."

	^ label ifNil: [ self labelForSelector: self key ]
]

{ #category : #accessing }
WAAttribute >> label: aString [
	label := aString
]

{ #category : #printing }
WAAttribute >> printOn: aStream [ 
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self key greaseString;
		nextPut: $)
]

{ #category : #converting }
WAAttribute >> stringForValue: anObject [ 
	^ anObject isNil ifFalse: [ anObject greaseString ]
]

{ #category : #converting }
WAAttribute >> valueFromString: aString [
	self subclassResponsibility
]
