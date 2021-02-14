Class {
	#name : #WAFileAttributeEditor,
	#superclass : #WAAttributeEditor,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAFileAttributeEditor >> configureLibrary: aLibrary [
	self show: aLibrary configurationComponent
]

{ #category : #accessing }
WAFileAttributeEditor >> handler [
	^ handler
]

{ #category : #accessing }
WAFileAttributeEditor >> handler: anObject [
	handler := anObject
]

{ #category : #accessing }
WAFileAttributeEditor >> libraries [
	^ configuration asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #rendering }
WAFileAttributeEditor >> renderConfigurationOn: html [
	| selectedLib |
	selectedLib := WAValueHolder new.
	html form: [
		html table: [
		 html tableRow: [
			html tableData: [
					html select
						list: self libraries;
						callback: [ :value | selectedLib contents: value ];
						size: 10 ].
			html tableData: [
				html anchor
						title: 'Configure selected file library';
						class: 'large';
						onClick: 'return submitForm(this)';
						callback: [ selectedLib contents isNil ifFalse: [ self configureLibrary: selectedLib contents default ] ];	
						with: 'Configure' ] ] ] ]
]
