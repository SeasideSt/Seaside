Class {
	#name : #WAFilterAttributeEditor,
	#superclass : #WAAttributeEditor,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WAFilterAttributeEditor >> addFilterForClass: aFilterClass [
	aFilterClass isNil
		ifFalse: [ self handler addFilter: aFilterClass new ]
]

{ #category : #accessing }
WAFilterAttributeEditor >> filters [
	^ handler filters
]

{ #category : #accessing }
WAFilterAttributeEditor >> handler [
	^ handler
]

{ #category : #accessing }
WAFilterAttributeEditor >> handler: anObject [
	handler := anObject
]

{ #category : #accessing }
WAFilterAttributeEditor >> potentialFilters [
	^ WAConfiguredRequestFilter allSubclasses
]

{ #category : #actions }
WAFilterAttributeEditor >> removeFilter: aFilter [
	self handler removeFilter: aFilter
]

{ #category : #rendering }
WAFilterAttributeEditor >> renderConfigurationOn: html [
	| filters |
	filters := self filters.
	html form: [
		self renderPossibleFiltersOn: html.
		html table
			cellspacing: 0;
			cellpadding: 0;
			with: [
				filters do: [ :each |
					html tableRow: [
						html tableData: each class name.
						html tableData: [
							(each isKindOf: WAConfiguredRequestFilter)
								ifTrue: [
									html anchor
										callback: [ self show: each configurationComponent ];
										with: 'Configure' ].
								html space.
								html anchor
									callback: [ self removeFilter: each ];
									with: 'Remove' ] ] ] ] ]
	
]

{ #category : #rendering }
WAFilterAttributeEditor >> renderPossibleFiltersOn: html [ 

	| selectedFilter filters |
	filters := self potentialFilters.
	html label: 'Possible filters: '.
	html break.
	selectedFilter := WAValueHolder new.
	html select
		list: filters;
		class: 'fix';
		labels: [ :each | each name ];
		callback: [ :value | selectedFilter contents: value ].
	html space.
	html anchor
			class: 'large';
			title: 'Add new filter';
			onClick: 'return submitForm(this)';
			callback: [ self addFilterForClass: selectedFilter contents ];	
			with: 'Add'

]
