"
A WAMemoryStatus displays information about memory usage.
"
Class {
	#name : #WAMemoryStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Squeak-Tools-Web'
}

{ #category : #accessing }
WAMemoryStatus >> priority [
	^ 700
]

{ #category : #rendering }
WAMemoryStatus >> renderFooterOn: html [
	| memoryEnd |
	
	memoryEnd := SmalltalkImage current vmParameterAt: 3.

	html tableFoot
		class: 'right';
		with: [
			self
				renderLabel: 'Total'
				value: (self printMemory: memoryEnd) on: html ]
]

{ #category : #rendering }
WAMemoryStatus >> renderHeaderOn: html [
	html tableHead: [
		html tableRow: [
			html tableData.
			html tableHeading: 'Absolute'.
			html tableHeading: 'Relative' ] ]
]

{ #category : #rendering }
WAMemoryStatus >> renderValuesOn: html [
	| oldSpaceEnd youngSpaceEnd memoryEnd parameters |
	parameters := SmalltalkImage current getVMParameters.
	
	oldSpaceEnd := parameters first.
	youngSpaceEnd := parameters second.
	memoryEnd := parameters third.
	
	self
		renderLabel: 'Old Space'
		value: (self printMemory: oldSpaceEnd)
		value: (self percent: oldSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Young Space'
		value: (self printMemory: (youngSpaceEnd - oldSpaceEnd))
		value: (self percent: youngSpaceEnd - oldSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Used'
		value: (self printMemory: youngSpaceEnd)
		value: (self percent: youngSpaceEnd / memoryEnd)
		on: html.
	self
		renderLabel: 'Free'
		value: (self printMemory: (memoryEnd - youngSpaceEnd))
		value: (self percent: memoryEnd - youngSpaceEnd / memoryEnd)
		on: html
]

{ #category : #accessing }
WAMemoryStatus >> tableBodyCssClass [
	^ 'right'
]

{ #category : #accessing }
WAMemoryStatus >> title [
	^ 'Memory'
]
