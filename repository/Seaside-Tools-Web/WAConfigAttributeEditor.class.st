Class {
	#name : #WAConfigAttributeEditor,
	#superclass : #WAAttributeEditor,
	#instVars : [
		'attributes'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WAConfigAttributeEditor >> attributes [
	^ attributes
]

{ #category : #accessing }
WAConfigAttributeEditor >> attributes: anObject [
	attributes := anObject
]

{ #category : #testing }
WAConfigAttributeEditor >> canClear [
	^ group ~~ #authentication
]

{ #category : #actions }
WAConfigAttributeEditor >> clearAttribute: anAttribute [
	self configuration removeExpressionAt: anAttribute key
]

{ #category : #rendering }
WAConfigAttributeEditor >> configureCollectionAttribute: anAttribute [
	self show: (anAttribute attributeEditor new configuration: configuration; attribute: anAttribute; yourself)
]

{ #category : #private }
WAConfigAttributeEditor >> hasLocalValueForAttribute: anAttribute [
	^ self configuration hasExpressionAt: anAttribute key
]

{ #category : #private }
WAConfigAttributeEditor >> inheritedValueAndSourceAt: aSymbol do: aBlock [
	self configuration ancestorsDo: [ :each |
		each expressionAt: aSymbol ifPresent: [ :exp |
			^ aBlock
				value: (each at: aSymbol)
				value: each ] ]
]

{ #category : #private }
WAConfigAttributeEditor >> isCollectionAttribute: anAttribute [
	^ anAttribute isCollectionAttribute
]

{ #category : #actions }
WAConfigAttributeEditor >> modifyCollectionAttribute: anAttribute [
	self configuration at: anAttribute key addAll: #() removeAll: #()
]

{ #category : #actions }
WAConfigAttributeEditor >> overrideAttribute: anAttribute [
	self configuration
		takeValue: (self configuration at: anAttribute key)
		forAttribute: anAttribute
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderActionsForAttribute: anAttribute on: html [
	html tableData: [
		| wasInherited |
		wasInherited := false.
		self inheritedValueAndSourceAt: anAttribute key do: [ :value :source |
			wasInherited ifFalse: [
				(self hasLocalValueForAttribute: anAttribute)
					ifTrue: [
						html anchor
							onClick: 'return submitForm(this)';
							title: 'revert to ' , value printString , ', overriden from ', source name;
							callback: [ self clearAttribute: anAttribute ]; 
							with: 'Revert' ]
					ifFalse: [
						html anchor
							onClick: 'return submitForm(this)';
							title: 'inherited from ', source name;
							callback: [ self overrideAttribute: anAttribute ]; 
							with: 'Override'.
						(self isCollectionAttribute: anAttribute) ifTrue: [
							html text: ' '.
							html anchor
								onClick: 'return submitForm(this)';
								callback: [ self modifyCollectionAttribute: anAttribute ];
								with: 'Modify' ] ].
			wasInherited := true ] ].
		wasInherited ifFalse: [
			(self hasLocalValueForAttribute: anAttribute)
				ifTrue: [
					self canClear
						ifTrue: [
							html anchor
								onClick: 'return submitForm(this)';
								callback: [ self clearAttribute: anAttribute ];
								with: 'Clear' ] ]
				ifFalse: [
					anAttribute default isNil
						ifTrue: [
							html span
								class: 'unspecified';
								with: '(unspecified)' ]
						ifFalse: [
							html anchor
								onClick: 'return submitForm(this)';
								title: 'inherited from attribute default';
								callback: [ self overrideAttribute: anAttribute ]; 
								with: 'Override'.
							(self isCollectionAttribute: anAttribute) ifTrue: [
								html text: ' '.
								html anchor
									onClick: 'return submitForm(this)';
									callback: [ self modifyCollectionAttribute: anAttribute ];
									with: 'Modify' ] ] ] ] ]
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderAttribute: anAttribute on: html [
	[ (anAttribute isAdvanced not or: [ self displayAdvancedAttributes ])
		ifTrue: [
			html tableRow: [
				html tableHeading: [
					html label
						title: anAttribute comment;
						with: anAttribute label ].
				html tableData: [
					(self isCollectionAttribute: anAttribute)
						ifTrue: [
							self renderCollectionFieldForAttribute: anAttribute on: html ]
						ifFalse: [
							self renderFieldForAttribute: anAttribute on: html ] ] ] ] ] on:  WAAttributeNotFound do: [ :ex | html text: ex ]
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderCollectionFieldForAttribute: anAttribute on: html [ 
	self visitAttribute: anAttribute on: html.
	html tableData:  [
		html anchor
			onClick: 'return submitForm(this)';
			title: 'Configure collection attribute';
			callback: [ self configureCollectionAttribute: anAttribute ];
			with: 'Configure' ]
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderConfigurationOn: html [
	html table: [
		attributes do: [ :attribute |
			self renderAttribute: attribute on: html ] ] 
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderFieldForAttribute: anAttribute on: html [ 
	(self configuration at: anAttribute key) isNil 
		ifTrue:  [
			self 
				visitAttribute: anAttribute
				on: html ]
		ifFalse: [
			(self hasLocalValueForAttribute: anAttribute) 
				ifTrue:  [
					self 
						visitAttribute: anAttribute
						on: html ]
				ifFalse: [
					self 
						renderInheritedAttribute: anAttribute
						on: html ] ].
	self 
		renderActionsForAttribute: anAttribute
		on: html
]

{ #category : #rendering }
WAConfigAttributeEditor >> renderInheritedAttribute: anAttribute on: html [ 
	html text: (anAttribute stringForValue: (self configuration at: anAttribute key))
]

{ #category : #rendering }
WAConfigAttributeEditor >> visitAttribute: anAttribute on: html [ 
	(WAUserConfigurationEditorVisitor 
		configuration: self configuration
		canvas: html) start: anAttribute
]
