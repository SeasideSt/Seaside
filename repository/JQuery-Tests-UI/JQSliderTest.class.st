Class {
	#name : #JQSliderTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQSliderTest >> testActions [
	self
		assert: ((self jQuery: 'span') slider setValue: 1)
		equals: self function , '("span").slider("value",1)'.
	self
		assert: ((self jQuery: 'span') slider setValue: 2 at: 3)
		equals: self function , '("span").slider("values",2,3)'.
	self
		assert: ((self jQuery: 'span') slider getValue)
		equals: self function , '("span").slider("value")'.
	self
		assert: ((self jQuery: 'span') slider getValueAt: 4)
		equals: self function , '("span").slider("values",4)'
]

{ #category : #tests }
JQSliderTest >> testOptions [
	self
		assert: ((self jQuery: 'span') slider value: 0)
		equals: self function , '("span").slider({"value":0})'

]
