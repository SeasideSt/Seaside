Class {
	#name : #WAUserConfigurationEditorVisitor,
	#superclass : #WAAttributeVisitor,
	#instVars : [
		'configuration',
		'canvas'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #'instance creation' }
WAUserConfigurationEditorVisitor class >> configuration: aUserConfiguration canvas: aRenderCanvas [
	^ self basicNew
		initializeWithConfiguration: aUserConfiguration canvas: aRenderCanvas;
		yourself
]

{ #category : #accessing }
WAUserConfigurationEditorVisitor >> configuration [
	^ configuration
]

{ #category : #accessing }
WAUserConfigurationEditorVisitor >> html [
	^ canvas
]

{ #category : #initialization }
WAUserConfigurationEditorVisitor >> initializeWithConfiguration: aUserConfiguration canvas: aRenderCanvas [
	self initialize.
	configuration := aUserConfiguration.
	canvas := aRenderCanvas
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitBooleanAttribute: anAttribute [
	self html select
		list: (Array with: true with: false);
		selected: (self configuration at: anAttribute key);
		labels: [ :bool | anAttribute stringForValue: bool ];
		callback: [ :value | self configuration takeValue: value forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitClassBindingAttribute: anAttribute [
	| options binding selected |
	options := anAttribute options asArray.
	binding := self configuration at: anAttribute key.
	(binding notNil and: [ (options includes: binding value) not ])
		ifTrue: [ options := (Array with: binding value), (options) ].
	selected := binding isNil ifTrue: [ nil ] ifFalse: [ binding value ].
	self html select
		list: options;
		selected: selected;
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each |
			self configuration
				takeValue: (GRPlatform current bindingOf: each)
				forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitClassBindingCollectionAttribute: anAttribute [ 
	| attributeCollection listSize |
	attributeCollection := self configuration currentCollectionAt: anAttribute key.
	attributeCollection isEmpty ifTrue: [ ^ self html text: '(none)' ].
	listSize := (attributeCollection size min: 10) max: 2.
	self html select
		disabled;
		size: listSize;
		title: 'Current';
		labels: [ :each |
			each value value greaseString, ' [' , each key greaseString, ']' ];
		list: attributeCollection
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitClassListAttribute: anAttribute [
	| options value selected |
	options := anAttribute options asArray.
	value := self configuration at: anAttribute key.
	(value notNil and: [ (options includes: value class) not ])
		ifTrue: [ options := (Array with: value class), options ].
	selected := value isNil ifTrue: [ nil ] ifFalse: [ value class ].
	self html select
		list: options;
		selected: selected;
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each | self configuration takeValue: each new forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitCollectionAttribute: anAttribute [ 
	| attributeCollection listSize |
	attributeCollection := self configuration currentCollectionAt: anAttribute key.
	attributeCollection isEmpty ifTrue: [ ^ self html text: '(none)' ].
	listSize := (attributeCollection size min: 10) max: 2.
	self html select
		disabled;
		size: listSize;
		title: 'Current';
		labels: [ :each | each value greaseString , ' [' , each key greaseString , ']' ];
		list: attributeCollection
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitListAttribute: anAttribute [
	| options value |
	options := anAttribute options asArray.
	value := self configuration at: anAttribute key.
	(value isNil or: [ options includes: value ])
		ifFalse: [ options := (Array with: value) , (options) ].
	self html select
		beOptional;
		list: options;
		selected: value;
		optionalLabel: '(none)';
		labels: [ :each | anAttribute stringForValue: each ];
		callback: [ :each | self configuration takeValue: each forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitNumberAttribute: anAttribute [
	self html textInput
		size: 5;
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ];
		value: (anAttribute stringForValue: (self configuration at: anAttribute key))
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitPasswordAttribute: anAttribute [
	self html passwordInput 
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitStringAttribute: anAttribute [
	self html textInput
		value: (anAttribute stringForValue: (self configuration at: anAttribute key));
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ]
]

{ #category : #visiting }
WAUserConfigurationEditorVisitor >> visitUrlAttribute: anAttribute [
	self html textInput
		size: 40;
		callback: [ :value | self configuration takeValueFromString: value forAttribute: anAttribute ];
		value: (anAttribute stringForValue: (self configuration at: anAttribute key))
]
