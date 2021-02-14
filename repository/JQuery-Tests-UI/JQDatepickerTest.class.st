Class {
	#name : #JQDatepickerTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQDatepickerTest >> testActions [
	self
		assert: ((self jQuery: 'input') datepicker getDate)
		equals: self function , '("input").datepicker("getDate")'.
	self
		assert: ((self jQuery: 'input') datepicker hide)
		equals: self function , '("input").datepicker("hide")'.
	self
		assert: ((self jQuery: 'input') datepicker isDisabled)
		equals: self function , '("input").datepicker("isDisabled")'.
	self
		assert: ((self jQuery: 'input') datepicker setDate: (Date year: 2010 month: 6 day: 11))
		equals: self function , '("input").datepicker("setDate",new Date(2010,5,11))'.
	self
		assert: ((self jQuery: 'input') datepicker show)
		equals: self function , '("input").datepicker("show")'
]
