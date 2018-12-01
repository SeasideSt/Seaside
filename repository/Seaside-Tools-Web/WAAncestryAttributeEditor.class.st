Class {
	#name : #WAAncestryAttributeEditor,
	#superclass : #WAAttributeEditor,
	#instVars : [
		'selectedConfiguration'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAAncestryAttributeEditor >> addParent: aParent [ 
	aParent isNil ifFalse: [
		self configuration addParent: aParent.
		(aParent isKindOf: WAAuthConfiguration) ifTrue: [
			self myApplication 
				preferenceAt: #login put: 'admin';
				preferenceAt: #passwordHash	put: (GRPlatform current secureHashFor: 'seaside');
				addFilter: WAAuthenticationFilter new ].
		self parent buildGroups.
		selectedConfiguration contents: aParent ]
]

{ #category : #initialization }
WAAncestryAttributeEditor >> initialize [ 
	super initialize.
	selectedConfiguration := WAValueHolder new
]

{ #category : #accessing }
WAAncestryAttributeEditor >> myApplication [
	^ self parent parent handler
]

{ #category : #actions }
WAAncestryAttributeEditor >> openConfiguration: aConfiguration [ 
	aConfiguration isNil ifFalse: [
		aConfiguration isShared ifTrue: [
			self show: aConfiguration configurationComponent ] ]
]

{ #category : #rendering }
WAAncestryAttributeEditor >> potentialParents [
	| configurations |
	configurations := WASystemConfiguration allSubclasses collect: [ :each | each instance ].
	configurations addAll: WASharedConfiguration configurations.
	^ configurations select: [ :each | 
		(self configuration canAddParent: each)
			and: [ (self configuration inheritsFrom: each) not ] ]
]

{ #category : #actions }
WAAncestryAttributeEditor >> removeConfiguration: aConfiguration [
	| myApplication authFilter |
	(aConfiguration isKindOf: WAAuthConfiguration) ifTrue: [
		myApplication := self myApplication.
		authFilter := myApplication filters detect: [ :each | each isKindOf: WAAuthenticationFilter ] ifNone: [ nil ].
		authFilter isNil ifFalse: [
			myApplication 
				preferenceAt: #login
				put: nil.
			myApplication 
				preferenceAt: #passwordHash
				put: nil.
			myApplication removeFilter: authFilter ] ].
	self configuration removeParent: aConfiguration.
	self parent buildGroups
]

{ #category : #rendering }
WAAncestryAttributeEditor >> renderAncestryListOn: html [
	html paragraph.
	html label: 'Assigned parents: '.
	html table: [
		html tableRow: [
			html tableData
				verticalAlign: 'top';
				with: [
					html select
						size: 5;
						selected: selectedConfiguration contents;
						class: 'fix';
						labels: [ :each | each isShared ifTrue: [ '(*) ' , each name ] ifFalse: [ each name ] ];
						list: self configuration parents;
						callback: [ :value | selectedConfiguration contents: value ] ].
			html tableData: [
				html anchor
					title: 'Move parent up';
					onClick: 'return submitForm(this)';
					callback: [ self configuration moveParentUp: selectedConfiguration contents ];
					with: [ html html: '&uarr;' ].
				html break; break.
				html anchor
					title: 'Remove parent configuration';
					onClick: 'return submitForm(this)';
					callback: [ self removeConfiguration: selectedConfiguration contents ];
					with: 'X'.
				html break; break.
				html anchor
					title: 'Move parent down';
					onClick: 'return submitForm(this)';
					callback: [ self configuration moveParentDown: selectedConfiguration contents ];
					with: [ html html: '&darr;' ] ] ] ].
	html break.
	html anchor
		class: 'large';
		title: 'Configure shared parent';
		onClick: 'return submitForm(this)';
		callback: [ self openConfiguration: selectedConfiguration contents ];
		with: 'Configure'
	
 
]

{ #category : #rendering }
WAAncestryAttributeEditor >> renderConfigurationOn: html [
	self renderParentSelectorOn: html.
	self renderAncestryListOn: html
]

{ #category : #rendering }
WAAncestryAttributeEditor >> renderParentSelectorOn: html [ 
	| selectedParent parents |
	parents := self potentialParents.
	html label: 'Possible parents: '.
	html break.
	selectedParent := WAValueHolder new.
	html select
		list: parents;
		class: 'fix';
		labels: [ :each | each name ];
		callback: [ :value | selectedParent contents: value ].
	html space.
	html anchor
		class: 'large';
		title: 'Add new parent configuration';
		onClick: 'return submitForm(this)';
		callback: [ self addParent: selectedParent contents ];	
		with: 'Add'

]
