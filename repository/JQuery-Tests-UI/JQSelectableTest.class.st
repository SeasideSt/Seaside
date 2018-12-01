Class {
	#name : #JQSelectableTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQSelectableTest >> testActions [
	self
		assert: ((self jQuery: 'ul') selectable refresh)
		equals: self function , '("ul").selectable("refresh")'
]
