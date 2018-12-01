Class {
	#name : #JQTabsTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQTabsTest >> testActions [
	self
		assert: ((self jQuery: 'ul') tabs disable: 2)
		equals: self function , '("ul").tabs("disable",2)'.
	self
		assert: ((self jQuery: 'ul') tabs enable: 3)
		equals: self function , '("ul").tabs("enable",3)'.
	self
		assert: ((self jQuery: 'ul') tabs refresh)
		equals: self function , '("ul").tabs("refresh")'.
	self
		assert: ((self jQuery: 'ul') tabs load: 5)
		equals: self function , '("ul").tabs("load",5)'
]
