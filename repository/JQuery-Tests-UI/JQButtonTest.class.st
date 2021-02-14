Class {
	#name : #JQButtonTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #tests }
JQButtonTest >> testIcons [
	self
		assert: ((self jQuery: 'input') button primaryIcon: 'foo')
		equals: self function , '("input").button({"icons":{"primary":"foo"}})'.
	self
		assert: ((self jQuery: 'input') button primaryIcon: 'foo'; secondaryIcon: 'bar')
		equals: self function , '("input").button({"icons":{"primary":"foo","secondary":"bar"}})'
]

{ #category : #tests }
JQButtonTest >> testOptions [
	self
		assert: ((self jQuery: 'input') button icons: Dictionary new)
		equals: self function , '("input").button({"icons":{}})'.
	self
		assert: ((self jQuery: 'input') button label: 'Hello')
		equals: self function , '("input").button({"label":"Hello"})'.
	self
		assert: ((self jQuery: 'input') button text: 'Something')
		equals: self function , '("input").button({"text":"Something"})'.
	self
		assert: ((self jQuery: 'input') button disabled: true)
		equals: self function , '("input").button({"disabled":true})'
]
