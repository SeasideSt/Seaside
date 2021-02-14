Class {
	#name : #SUEffect,
	#superclass : #PTNamed,
	#category : 'Scriptaculous-Core'
}

{ #category : #'options-move' }
SUEffect >> absolute [
	self mode: 'absolute'
]

{ #category : #'effects-combination' }
SUEffect >> appear [
	"Make an element appear. If the element was previously set to display:none; inside the style attribute of the element, the effect will automatically show the element. This means that it must be places under the style attribute of an object, and not in the CSS in the head of the document or a linked file."

	self create; method: 'Appear'
]

{ #category : #'effects-combination' }
SUEffect >> blindDown [
	"Simulate a window blind, where the contents of the affected elements stay in place."

	self create; method: 'BlindDown'
]

{ #category : #'effects-combination' }
SUEffect >> blindUp [
	"Simulate a window blind, where the contents of the affected elements stay in place."

	self create; method: 'BlindUp'
]

{ #category : #private }
SUEffect >> defaultMethod [
	^ 'toggle'
]

{ #category : #private }
SUEffect >> defaultPrototype [
	^ 'Effect'
]

{ #category : #options }
SUEffect >> direction: aString [
	"Set the direction of the transition. Values can be either 'top-left', 'top-right', 'bottom-left', 'bottom-right' or 'center' (default). Applicable only on Grow and Shrink effects."

	self optionAt: 'direction' put: aString
]

{ #category : #'effects-combination' }
SUEffect >> dropOut [
	"Make the element drop and fade out at the same time."

	self create; method: 'DropOut'
]

{ #category : #options }
SUEffect >> duration: aNumber [
	"Duration of the effect in seconds, given as a float. Defaults to 1.0."

	self optionAt: 'duration' put: aNumber
]

{ #category : #'options-highlight' }
SUEffect >> endColor: aColor [
	"Sets the color of the last frame of the highlight. This is best set to the background color of the highlighted element."

	self optionAt: 'endcolor' put: aColor
]

{ #category : #effects }
SUEffect >> event [
	"One-shot events that follow timelines defined by effect queues."

	self create; method: 'Event'; arguments: #()
]

{ #category : #'effects-combination' }
SUEffect >> fade [
	"Make an element fade away and takes it out of the document flow at the end of the effect by setting the CSS display property to none."

	self create; method: 'Fade'
]

{ #category : #'effects-combination' }
SUEffect >> fold [
	"Reduce the element to its top then to left to make it disappear."

	self create; method: 'Fold'
]

{ #category : #options }
SUEffect >> fps: aNumber [
	"Target this many frames per second. Default to 25. Can't be higher than 100."

	self optionAt: 'fps' put: aNumber
]

{ #category : #options }
SUEffect >> from: aNumber [
	"Sets the starting point of the transition, a float between 0.0 and 1.0. Defaults to 0.0."

	self optionAt: 'from' put: aNumber
]

{ #category : #'effects-combination' }
SUEffect >> grow [
	"See a demo."

	self create; method: 'Grow'
]

{ #category : #effects }
SUEffect >> highlight [
	"This effect Flashes a color as the background of an element. It is mostly used to draw attention to a part of the page that has been updated via javascript or AJAX, when the update would not otherwise be obvious."

	self create; method: 'Highlight'
]

{ #category : #'options-move' }
SUEffect >> mode: aString [
	"Defaults to 'relative', can also be 'absolute', specifies if the element is moved absolutely or relative to its own position."
	
	self optionAt: 'mode' put: aString
]

{ #category : #effects }
SUEffect >> morph [
	"This effect morphs to a given CSS style rule. It does take orginal styles given by CSS style rules or the style attribute into consideration when calculating the transforms. It works with all length and color based CSS properties, including margins, paddings, borders, opacity and text/background colors."

	self create; method: 'Morph'
]

{ #category : #effects }
SUEffect >> move [
	"This effect moves an element by modifying its position attributes."
	
	self create; method: 'Move'
]

{ #category : #effects }
SUEffect >> move: aPoint [
	self x: aPoint x; y: aPoint y; move
]

{ #category : #'options-scroll' }
SUEffect >> offset: anInteger [
	"Negative or positive number of pixels as offset to the top of view."

	self optionAt: 'offset' put: anInteger
]

{ #category : #events }
SUEffect >> onAfterFinish: anObject [
	"Called after the last redraw of the effect was made."

	self options at: 'afterFinish' put: anObject asFunction
]

{ #category : #events }
SUEffect >> onAfterUpdate: anObject [
	"Called on each iteration of the effects rendering loop, after the redraw takes places."

	self options at: 'afterUpdate' put: anObject asFunction
]

{ #category : #events }
SUEffect >> onBeforeStart: anObject [
	"Called before the main effects rendering loop is started."

	self options at: 'beforeStart' put: anObject asFunction
]

{ #category : #events }
SUEffect >> onBeforeUpdate: anObject [
	"Called on each iteration of the effects rendering loop, before the redraw takes places."

	self options at: 'beforeUpdate' put: anObject asFunction
]

{ #category : #effects }
SUEffect >> opacity [
	"This effect changes an element's opacity"

	self create; method: 'Opacity'
]

{ #category : #effects }
SUEffect >> parallel: aCollection [
	"This is a special effect to allow to combine more than one core effect into a parallel effect."

	self create; method: 'Parallel'; arguments: (Array with: aCollection)
]

{ #category : #'effects-combination' }
SUEffect >> puff [
	"Give the illusion of the element puffing away (like a in a cloud of smoke)."

	self create; method: 'Puff'
]

{ #category : #'effects-combination' }
SUEffect >> pulsate [
	"Pulsate the element, loops over five times over fading out and in."

	self create; method: 'Pulsate'
]

{ #category : #'options-pulsate' }
SUEffect >> pulses: anInteger [
	"Control the amount of pulses."

	self optionAt: 'pulses' put: anInteger
]

{ #category : #options }
SUEffect >> queue: aString [
	"Sets queuing options. When used with a string, can be 'front' or 'end' or 'with-last' to queue the effect in the global effects queue at the beginning or end, or a queue parameter object that can have {position: 'front/end', scope: 'scope', limit:1}."

	self optionAt: 'queue' put: aString
]

{ #category : #'options-move' }
SUEffect >> relative [
	self mode: 'relative'
]

{ #category : #'options-highlight' }
SUEffect >> restoreColor: aColor [
	"Sets the background color of the element after the highlight has finished."

	self optionAt: 'restorecolor' put: aColor
]

{ #category : #effects }
SUEffect >> scale: aNumber [
	"This effect changes an elements width and height dimensions and the base for em units. This allows for smooth, automatic relative scaling of elements contained within the scaled element."

	self create; method: 'Scale'; arguments: self arguments , (Array with: aNumber)
]

{ #category : #'options-scale' }
SUEffect >> scaleContent: aBoolean [
	"Set whether content scaling should be enabled, defaults to true."

	self optionAt: 'scaleContent' put: aBoolean
]

{ #category : #'options-scale' }
SUEffect >> scaleFrom: aNumber [
	"Set the starting percentage for scaling, defaults to 100.0."

	self optionAt: 'scaleFrom' put: aNumber
]

{ #category : #'options-scale' }
SUEffect >> scaleFromCenter: aBoolean [
	"If true, scale the element in a way that the center of the element stays on the same position on the screen, defaults to false."

	self optionAt: 'scaleFromCenter' put: aBoolean
]

{ #category : #'options-scale' }
SUEffect >> scaleMode: anObject [
	"Either 'box' (default, scales the visible area of the element) or 'contents' (scales the complete element, that is parts normally only visible byscrolling are taken into account). You can also precisely control the size the element will become by assigning the originalHeight and originalWidth variables to scaleMode."

	self optionAt: 'scaleMode' put: anObject
]

{ #category : #'options-scale' }
SUEffect >> scaleX: aBoolean [
	"Set whether the element should be scaled horizontally, defaults to true."

	self optionAt: 'scaleX' put: aBoolean
]

{ #category : #'options-scale' }
SUEffect >> scaleY: aBoolean [
	"Set whether the element should be scaled vertically, defaults to true."

	self optionAt: 'scaleY' put: aBoolean
]

{ #category : #effects }
SUEffect >> scroll [
	"Scroll page view to element."

	self create; method: 'ScrollTo'
]

{ #category : #'effects-combination' }
SUEffect >> shake [
	"Move the element slightly to the left, then to the right, repeatedly."

	self create; method: 'Shake'
]

{ #category : #'effects-combination' }
SUEffect >> shrink [
	"Reduce the element to its top-left corner."

	self create; method: 'Shrink'
]

{ #category : #'effects-combination' }
SUEffect >> slideDown [
	"Simulate a window blind, where the contents of the affected elements scroll up and down accordingly."

	self create; method: 'SlideDown'
]

{ #category : #'effects-combination' }
SUEffect >> slideUp [
	"Simulate a window blind, where the contents of the affected elements scroll up and down accordingly."

	self create; method: 'SlideUp'
]

{ #category : #'effects-combination' }
SUEffect >> squish [
	"Reduce the element to its top-left corner."

	self create; method: 'Squish'
]

{ #category : #'options-highlight' }
SUEffect >> startColor: aColor [
	"Sets the color of first frame of the highlight."

	self optionAt: 'startcolor' put: aColor
]

{ #category : #'options-morph' }
SUEffect >> style: aString [
	"Target CSS style rule for a morph transition."

	self optionAt: 'style' put: aString
]

{ #category : #'effects-combination' }
SUEffect >> switchOff [
	"Give the illusion of a TV-style switch off."

	self create; method: 'SwitchOff'
]

{ #category : #options }
SUEffect >> sync: aBoolean [
	"Sets whether the effect should render new frames automatically (which it does by default). If true, you can render frames manually by calling the render() instance method of an effect. This is used by Effect.Parallel()."

	self optionAt: 'sync' put: aBoolean
]

{ #category : #options }
SUEffect >> to: aNumber [
	"Sets the end point of the transition, a float between 0.0 and 1.0. Defaults to 1.0."

	self optionAt: 'to' put: aNumber
]

{ #category : #'effects-toggles' }
SUEffect >> toggle: aString [
	"Allow for easily toggling elements with an animation."

	self method: 'toggle'; arguments: self arguments , (Array with: aString)
]

{ #category : #'effects-toggles' }
SUEffect >> toggleAppear [
	self toggle: 'Appear'
]

{ #category : #'effects-toggles' }
SUEffect >> toggleBlind [
	self toggle: 'Blind'
]

{ #category : #'effects-toggles' }
SUEffect >> toggleSlide [
	self toggle: 'Slide'
]

{ #category : #options }
SUEffect >> transition: anObject [
	"Sets a function that modifies the current point of the animation, which is between 0 and 1. Following transitions are supplied: Effect.Transitions.sinoidal (default), Effect.Transitions.linear, Effect.Transitions.reverse, Effect.Transitions.wobble and Effect.Transitions.flicker."

	self optionAt: 'transition' put: anObject asFunction
]

{ #category : #effects }
SUEffect >> tweenFrom: aFromInteger to: aToInteger using: aStringOrFunction [
	"This effect tweens between two values and sets a property or calls a method on an object; or allows for a callback method, which will be automatically bound to the object."

	self create; method: 'Tween'; arguments: self arguments , (Array with: aFromInteger with: aToInteger with: aStringOrFunction)
]

{ #category : #'options-move' }
SUEffect >> x: anInteger [
	"Either the new absolute target of the effect elements top value or the modifier of its current top value, depending on the mode option."
	
	self optionAt: 'x' put: anInteger
]

{ #category : #'options-move' }
SUEffect >> y: anInteger [
	"Either the new absolute target of the effect elements top value or the modifier of its current top value, depending on the mode option."
	
	self optionAt: 'y' put: anInteger
]
