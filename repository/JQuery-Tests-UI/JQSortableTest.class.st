Class {
	#name : #JQSortableTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQSortableTest >> testActions [
	self
		assert: ((self jQuery: 'ul') sortable cancel)
		equals: self function , '("ul").sortable("cancel")'.
	self
		assert: ((self jQuery: 'ul') sortable refresh)
		equals: self function , '("ul").sortable("refresh")'.
	self
		assert: ((self jQuery: 'ul') sortable refreshPositions)
		equals: self function , '("ul").sortable("refreshPositions")'
]
