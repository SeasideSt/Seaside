Class {
	#name : #JQDialogTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQDialogTest >> testActions [
	self
		assert: ((self jQuery: 'div') dialog close)
		equals: self function , '("div").dialog("close")'.
	self
		assert: ((self jQuery: 'div') dialog isOpen)
		equals: self function , '("div").dialog("isOpen")'.
	self
		assert: ((self jQuery: 'div') dialog moveToTop)
		equals: self function , '("div").dialog("moveToTop")'.
	self
		assert: ((self jQuery: 'div') dialog open)
		equals: self function , '("div").dialog("open")'
]
