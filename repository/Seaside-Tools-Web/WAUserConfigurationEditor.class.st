Class {
	#name : #WAUserConfigurationEditor,
	#superclass : #WAComponent,
	#instVars : [
		'configuration',
		'groups',
		'parent',
		'dialog'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #'instance creation' }
WAUserConfigurationEditor class >> on: aUserConfiguration [
	^ self basicNew initializeOn: aUserConfiguration; yourself
]

{ #category : #actions }
WAUserConfigurationEditor >> apply [
]

{ #category : #accessing }
WAUserConfigurationEditor >> beComponent [
	dialog := false
]

{ #category : #accessing }
WAUserConfigurationEditor >> beDialog [
	dialog := true
]

{ #category : #accessing }
WAUserConfigurationEditor >> buildGroups [
	groups := OrderedCollection new.
	groups add: (WAAncestryAttributeEditor new configuration: configuration; group: #inheritedConfiguration; parent: self; yourself).
	groups addAll:
		(self groupedAttributes collect: [ :association | 
			WAConfigAttributeEditor new
				configuration: configuration;
				attributes: association value;
				group: association key;
				parent: self;
				hasAdvancedAttributes: (self includesAdvanced: association value);
				yourself ])
]

{ #category : #actions }
WAUserConfigurationEditor >> cancel [
	dialog ifTrue: [ self answer: nil ]
]

{ #category : #hooks }
WAUserConfigurationEditor >> children [
	^ groups
]

{ #category : #accessing }
WAUserConfigurationEditor >> configuration [
	^ configuration
]

{ #category : #attributes }
WAUserConfigurationEditor >> groupedAttributes [
	| groupsDict attributes |
	groupsDict := Dictionary new.
	attributes := SortedCollection sortBlock: [ :a :b | a key <= b key ].
	self configuration allAttributes do: [ :each |
		(groupsDict
			at: each group
			ifAbsentPut: [ SortedCollection sortBlock: [ :a :b | a key <= b key ] ])
				add: each ].
	groupsDict associationsDo: [ :association | attributes add: association ].
	^ attributes
]

{ #category : #accessing }
WAUserConfigurationEditor >> groups [
	^ groups
]

{ #category : #accessing }
WAUserConfigurationEditor >> includesAdvanced: attributes [
	^ attributes anySatisfy: [ :each | each isAdvanced ]
]

{ #category : #initialization }
WAUserConfigurationEditor >> initializeOn: aUserConfiguration [
	self initialize.
	dialog := true.
	WASystemConfiguration clearAllDescriptions.
	configuration := aUserConfiguration.
	self buildGroups
]

{ #category : #actions }
WAUserConfigurationEditor >> ok [
	dialog
		ifTrue: [ self answer ]
]

{ #category : #accessing }
WAUserConfigurationEditor >> parent [
	^ parent ifNil: [ ^ self ]
]

{ #category : #accessing }
WAUserConfigurationEditor >> parent: aComponent [ 
	parent := aComponent 
]

{ #category : #accessing }
WAUserConfigurationEditor >> parents [
	^ self configuration parents
]

{ #category : #rendering }
WAUserConfigurationEditor >> renderButtonsOn: html [
	html paragraph: [
		dialog 
			ifTrue: [ html submitButton on: #ok of: self ].
		html submitButton on: #apply of: self.
		html cancelButton on: #cancel of: self ]
]

{ #category : #rendering }
WAUserConfigurationEditor >> renderContentOn: html [
	self configuration isShared
		ifTrue: [ html heading: self configuration name ].
	html form: [
		self renderFormOn: html.
		self renderButtonsOn: html ]
]

{ #category : #rendering }
WAUserConfigurationEditor >> renderFormOn: html [
	groups do: [ :each | html render: each ]
]
