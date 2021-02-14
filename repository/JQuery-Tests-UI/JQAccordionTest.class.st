Class {
	#name : #JQAccordionTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQAccordionTest >> testActions [
	self
		assert: ((self jQuery: 'img') accordion option:'active' put: 3)
		equals: self function , '("img").accordion("option","active",3)'
]
