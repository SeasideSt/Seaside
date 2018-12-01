Class {
	#name : #WAAttributeEditor,
	#superclass : #WAComponent,
	#instVars : [
		'configuration',
		'group',
		'properties',
		'parent'
	],
	#classVars : [
		'HelpTexts',
		'PropertiesCache'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WAAttributeEditor class >> helpTextFor: group [
	^ self helpTexts at: group ifAbsent: [ nil ]
]

{ #category : #accessing }
WAAttributeEditor class >> helpTexts [
	HelpTexts ifNil: [ self initHelpTexts ].
	^ HelpTexts
]

{ #category : #accessing }
WAAttributeEditor class >> initHelpTexts [
	HelpTexts := Dictionary new.
	HelpTexts at: #inheritedConfiguration put: 'Modify references to other configurations.
	- You can add user or global configs
	- Only shared configs (marked with *) can be configured'.
	^ HelpTexts
]

{ #category : #accessing }
WAAttributeEditor class >> propertiesCache [
	^ PropertiesCache ifNil: [ PropertiesCache := Dictionary new ]
]

{ #category : #accessing }
WAAttributeEditor class >> updatePropertiesCacheFor: anEditor [
	 self propertiesCache at: anEditor group put: anEditor properties 
]

{ #category : #settings }
WAAttributeEditor >> collapsed [
	^ self propertyAt: #collapsed ifAbsent: [ false ]
]

{ #category : #settings }
WAAttributeEditor >> collapsed: aBoolean [
	^ self propertyAt: #collapsed put: aBoolean 
]

{ #category : #accessing }
WAAttributeEditor >> collapsedByDefault [
	^ false
]

{ #category : #accessing }
WAAttributeEditor >> configuration [
	^ configuration
]

{ #category : #accessing }
WAAttributeEditor >> configuration: anObject [
	configuration := anObject
]

{ #category : #settings }
WAAttributeEditor >> displayAdvancedAttributes [
	^ self propertyAt: #displayAdvanced ifAbsent: [ false ]
]

{ #category : #settings }
WAAttributeEditor >> displayAdvancedAttributes: aBoolean [
	self propertyAt: #displayAdvanced put: aBoolean 
]

{ #category : #accessing }
WAAttributeEditor >> group [
	^ group
]

{ #category : #accessing }
WAAttributeEditor >> group: anObject [
	group := anObject.
	self setCachedProperties.
	self showHelp: false

]

{ #category : #settings }
WAAttributeEditor >> hasAdvancedAttributes [
	^ self propertyAt: #hasAdvanced ifAbsent: [ false ]
]

{ #category : #settings }
WAAttributeEditor >> hasAdvancedAttributes: aBoolean [
	self propertyAt: #hasAdvanced put: aBoolean 
]

{ #category : #accessing }
WAAttributeEditor >> hasAdvancedAttributesDefault [
	^ false
]

{ #category : #settings }
WAAttributeEditor >> helpEnabled [
	^ self propertyAt: #helpEnabled ifAbsent: [ false ]
]

{ #category : #initialization }
WAAttributeEditor >> initialize [ 
	super initialize.
	properties := Dictionary new.
	self hasAdvancedAttributes: self hasAdvancedAttributesDefault.
	self displayAdvancedAttributes: false.
	self collapsed: self collapsedByDefault.
	self showHelp: false

]

{ #category : #accessing }
WAAttributeEditor >> parent [
	^ parent
]

{ #category : #accessing }
WAAttributeEditor >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
WAAttributeEditor >> properties [
	^ properties
]

{ #category : #accessing }
WAAttributeEditor >> properties: props [ 
	properties := props
]

{ #category : #accessing }
WAAttributeEditor >> propertyAt: aSymbol ifAbsent: absentBlock [
	^ properties at: aSymbol ifAbsent: absentBlock
]

{ #category : #accessing }
WAAttributeEditor >> propertyAt: aSymbol put: anObject [

	properties at: aSymbol put: anObject.
	group isNil ifFalse: [ self class updatePropertiesCacheFor: self ]
]

{ #category : #rendering }
WAAttributeEditor >> renderActionsOn: html [
	html span
		class: 'action';
		with: [
			self hasAdvancedAttributes ifTrue: [
				html anchor
					class: 'minus' if: self displayAdvancedAttributes;
					class: 'plus' if: self displayAdvancedAttributes not;
					title: (self displayAdvancedAttributes
						ifTrue: [ 'Hide advanced attributes' ]
						ifFalse: [ 'Show advanced attributes' ]);
					callback: [ self toggleAdvanced ].
				html space ].
			html anchor
				class: 'down' if: self collapsed;
				class: 'up' if: self collapsed not;
				title: (self collapsed
					ifTrue: [ 'Expand' ]
					 ifFalse: [ 'Collapse' ]);
				callback: [ self toggleVisbility ].
			(self class helpTextFor: group) isNil ifFalse: [
				html space.
				html anchor
					class: 'help';
					title: (self showHelp
						ifTrue: [ 'Hide Help' ]
						ifFalse: [ 'Show Help' ]);
					callback: [ self toggleHelp ] ] ]
]

{ #category : #rendering }
WAAttributeEditor >> renderConfigurationOn: html [
	self subclassResponsibility 
]

{ #category : #rendering }
WAAttributeEditor >> renderContentOn: html [
	self
		renderGroup: [ self renderConfigurationOn: html ]
		named: (self labelForSelector: group)
		on: html
				
]

{ #category : #rendering }
WAAttributeEditor >> renderGroup: aBlock named: aName on: html [
	html div class: 'group';
		 with: [
			html div
				class: 'groupTitle';
				with: [
					html label: aName.
					self renderActionsOn: html ].
			self collapsed 
				ifFalse: [
					self showHelp 
						ifTrue: [
							html div
								class: 'help';
								with: [
									html code: (self class helpTextFor: group) ] ]
						ifFalse: [
							html div
								class: 'groupContent';
								with: aBlock ] ] ]
]

{ #category : #settings }
WAAttributeEditor >> setCachedProperties [
	| props | 
	props := self class propertiesCache at: group ifAbsent: [ nil ].
	props isNil ifFalse: [
		self properties: props.
		self showHelp: false ] 
]

{ #category : #delegation }
WAAttributeEditor >> show: aComponent onAnswer: aBlock [
	^ parent isNil
		ifFalse: [ parent parent show: aComponent onAnswer: aBlock ]
		ifTrue: [ super show: aComponent onAnswer: aBlock ]
]

{ #category : #settings }
WAAttributeEditor >> showHelp [
	^ self propertyAt: #showHelp ifAbsent: [ false ]
]

{ #category : #settings }
WAAttributeEditor >> showHelp: aBoolean [
	^ self propertyAt: #showHelp put: aBoolean 
]

{ #category : #actions }
WAAttributeEditor >> toggleAdvanced [
	self displayAdvancedAttributes: self displayAdvancedAttributes not.
	self displayAdvancedAttributes
		ifTrue: [ self collapsed: false ]
]

{ #category : #actions }
WAAttributeEditor >> toggleHelp [
	self showHelp: self showHelp not.
	self showHelp
		ifTrue: [ self collapsed: false ]
]

{ #category : #actions }
WAAttributeEditor >> toggleVisbility [
	self collapsed: self collapsed not.
	self collapsed
		ifTrue: [ self showHelp: false ]
]
