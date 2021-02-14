Class {
	#name : #WADispatcherCopyPage,
	#superclass : #WADispatcherSubPage,
	#instVars : [
		'name',
		'handler'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WADispatcherCopyPage >> copyHandler [
	| newHandler |
	newHandler := self handler parent 
		register: self handler cloneHandler
		at: name.
	^ self answer: newHandler
]

{ #category : #accessing }
WADispatcherCopyPage >> dispatcher [
	^ handler
]

{ #category : #accessing }
WADispatcherCopyPage >> handler [
	^ handler
]

{ #category : #accessing }
WADispatcherCopyPage >> handler: aRequestHandler [ 
	handler := aRequestHandler
]

{ #category : #rendering }
WADispatcherCopyPage >> renderContentOn: html [ 
	html heading
		level: 2;
		with: 'Copy request handler: ' , self handler name.
	html form: [
		html table: [
			html tableRow: [
				html tableData
					class: 'label';
					with: 'Name for new request handler: '.
				html tableData:  [
					html textInput
						value: handler name , '_copy';
						callback: [ :value | name := value ] ] ] ].
		html break.
		html submitButton
			callback: [ self copyHandler ];
			with: 'OK'.
		html space.
		html submitButton
			callback: [ self answer: nil ];
			with: 'Cancel' ]
]
