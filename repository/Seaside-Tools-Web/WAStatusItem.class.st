Class {
	#name : #WAStatusItem,
	#superclass : #WAComponent,
	#category : 'Seaside-Tools-Web'
}

{ #category : #testing }
WAStatusItem class >> isAbstract [
	^ self name = #WAStatusItem
]

{ #category : #'instance creation' }
WAStatusItem class >> sortedConcreteSubinstances [
	^ ((self allSubclasses
		reject: [ :each | each isAbstract ])
		collect: [ :each | each new ])
			sorted
]

{ #category : #comparing }
WAStatusItem >> <= otherStatusItem [
	^ (self priority < otherStatusItem priority) or: [
		(self priority = otherStatusItem priority) and: [
			self label <= otherStatusItem label ] ]
]

{ #category : #testing }
WAStatusItem >> isSupported [
	^ true
]

{ #category : #accessing }
WAStatusItem >> label [
	^ self title
]

{ #category : #accessing }
WAStatusItem >> priority [
	self subclassResponsibility
]

{ #category : #rendering }
WAStatusItem >> renderContentOn: html [
	
	html table: [
		self renderHeaderOn: html.
		self renderFooterOn: html.
		html tableBody
			class: self tableBodyCssClass;
			with: [ self renderValuesOn: html ] ]
]

{ #category : #rendering }
WAStatusItem >> renderFooterOn: html [
	"subclasses can implement"
]

{ #category : #rendering }
WAStatusItem >> renderHeaderOn: html [
	"subclasses can implement"
]

{ #category : #rendering }
WAStatusItem >> renderLabel: aLabelString on: html [
	html tableHeading: aLabelString, ':'
]

{ #category : #rendering }
WAStatusItem >> renderLabel: aLabelString value: anObject on: html [
	html tableRow: [
		self renderLabel: aLabelString on: html.
		self renderValue: anObject on: html ]
]

{ #category : #rendering }
WAStatusItem >> renderLabel: aLabelString value: aFirstObject value: aSecondObject on: html [
	html tableRow: [
		self renderLabel: aLabelString on: html.
		self renderValue: aFirstObject on: html.
		self renderValue: aSecondObject on: html ]
]

{ #category : #rendering }
WAStatusItem >> renderLabel: aLabelString value: aFirstObject value: aSecondObject value: aThirdObject on: html [
	html tableRow: [
		self renderLabel: aLabelString on: html.
		self renderValue: aFirstObject on: html.
		self renderValue: aSecondObject on: html.
		self renderValue: aThirdObject on: html ]
]

{ #category : #rendering }
WAStatusItem >> renderValue: anObject on: html [
	html tableData: anObject
]

{ #category : #rendering }
WAStatusItem >> renderValuesOn: html [
	
	self subclassResponsibility
]

{ #category : #accessing }
WAStatusItem >> tableBodyCssClass [
	^ 'left'
]

{ #category : #accessing }
WAStatusItem >> title [
	self subclassResponsibility
]
