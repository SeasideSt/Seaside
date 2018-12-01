Class {
	#name : #SUSlider,
	#superclass : #PTPrototype,
	#instVars : [
		'handleId',
		'trackId'
	],
	#category : 'Scriptaculous-Core-Controls'
}

{ #category : #options }
SUSlider >> alignX: anNumber [
	"This will move the starting point on the x-axis for the handle in relation to the track. It is often used to move the 'point' of the handle to where 0 should be. It can also be used to set a different starting point on the track."

	self optionAt: 'alignX' put: anNumber
]

{ #category : #options }
SUSlider >> alignY: anNumber [
	"This will move the starting point on the y-axis for the handle in relation to the track. It is often used to move the 'point' of the handle to where 0 should be. It can also be used to set a different starting point on the track."

	self optionAt: 'alignY' put: anNumber
]

{ #category : #options }
SUSlider >> axis: aSymbol [
	"Sets the direction that the slider will move in. It should either be horizontal or vertical."

	self optionAt: 'axis' put: aSymbol
]

{ #category : #private }
SUSlider >> defaultArguments [
	^ (Array with: self handleId with: self trackId) , super defaultArguments
]

{ #category : #private }
SUSlider >> defaultPrototype [
	^ 'Control.Slider'
]

{ #category : #options }
SUSlider >> disabled: aBoolean [
	"This will lock the slider so that it will not move and thus is disabled."

	self optionAt: 'disabled' put: aBoolean
]

{ #category : #accessing }
SUSlider >> handleId [
	^ handleId
]

{ #category : #accessing }
SUSlider >> handleId: aString [
	^ handleId := aString
]

{ #category : #options }
SUSlider >> increment: aNumber [
	"Defines the relationship of value to pixels. Setting this to 1 will mean each movement of 1 pixel equates to 1 value."

	self optionAt: 'increment' put: aNumber
]

{ #category : #initialization }
SUSlider >> initialize [
	super initialize.
	self create
]

{ #category : #options }
SUSlider >> maximum: aNumber [
	"The maximum value that the slider will move to. For horizontal this is to the right while vertical it is down."

	self optionAt: 'maximum' put: aNumber
]

{ #category : #options }
SUSlider >> minimum: aNumber [
	"The minimum value that the slider can move to. For horizontal this is to the left while vertical it is up."

	self optionAt: 'minimum' put: aNumber
]

{ #category : #events }
SUSlider >> onChange: anObject [
	"Called whenever the Slider has finished moving or has had its value changed. The called function gets the slider value as its parameter."

	self optionAt: 'onChange' put: anObject asFunction
]

{ #category : #events }
SUSlider >> onSlide: anObject [
	"Called whenever the Slider is moved by dragging. The called function gets the slider value as its parameter."

	self optionAt: 'onSlide' put: anObject asFunction
]

{ #category : #options }
SUSlider >> range: anInterval [
	self optionAt: 'range' put: anInterval
]

{ #category : #accessing }
SUSlider >> trackId [
	^ trackId
]

{ #category : #accessing }
SUSlider >> trackId: aString [
	trackId := aString
]

{ #category : #options }
SUSlider >> value: aNumber [
	"Will set the initial slider value. The handle will be set to this value, assuming it is within the minimum and maxium values."

	self optionAt: 'sliderValue' put: aNumber
]

{ #category : #options }
SUSlider >> values: anArray [
	"Accepts an array of integers. If set these will be the only legal values for the slider to be at. Thus you can set specific slider values that the user can move the slider to."

	self optionAt: 'values' put: anArray
]
