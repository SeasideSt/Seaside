Class {
	#name : #SUEffectTest,
	#superclass : #JSObjectTest,
	#category : 'Scriptaculous-Tests-Core-Unit'
}

{ #category : #accessing }
SUEffectTest >> effect [
	^ SUEffect context: self renderContext
]

{ #category : #tests }
SUEffectTest >> testBasic [
	self
		assert: self effect
		equals: 'Effect.toggle(this)'.
	self
		assert: (self effect id: 'foo'; fps: 24)
		equals: 'Effect.toggle("foo",{"fps":24})'.
	self
		assert: (self effect id: 'bar'; duration: 2; shake)
		equals: 'new Effect.Shake("bar",{"duration":2})'
]

{ #category : #tests }
SUEffectTest >> testMorph [
	self
		assert: (self effect style: 'color: #f00;'; morph)
		equals: 'new Effect.Morph(this,{"style":"color: #f00;"})'.
	self
		assert: (self effect id: 'foo'; style: 'color: #f00;'; morph)
		equals: 'new Effect.Morph("foo",{"style":"color: #f00;"})'
]

{ #category : #tests }
SUEffectTest >> testMove [
	self
		assert: (self effect move: 1 @ 2)
		equals: 'new Effect.Move(this,{"x":1,"y":2})'.
	self
		assert: (self effect id: 'foo'; absolute; move: 3 @ 5)
		equals: 'new Effect.Move("foo",{"mode":"absolute","x":3,"y":5})'
]

{ #category : #tests }
SUEffectTest >> testOpacitiy [
	self
		assert: (self effect opacity)
		equals: 'new Effect.Opacity(this)'.
	self
		assert: (self effect opacity; id: 'foo'; duration: 1)
		equals: 'new Effect.Opacity("foo",{"duration":1})'
]

{ #category : #tests }
SUEffectTest >> testParallel [
	self
		assert: (self effect parallel: (Array with: self effect fade with: self effect slideUp))
		equals: 'new Effect.Parallel([new Effect.Fade(this),new Effect.SlideUp(this)])'.
	self
		assert: (self effect fps: 12; parallel: (Array with: self effect fade with: self effect slideUp))
		equals: 'new Effect.Parallel([new Effect.Fade(this),new Effect.SlideUp(this)],{"fps":12})'
]

{ #category : #tests }
SUEffectTest >> testScale [
	self
		assert: (self effect scale: 50)
		equals: 'new Effect.Scale(this,50)'.
	self
		assert: (self effect id: 'foo'; duration: 1; scale: 25)
		equals: 'new Effect.Scale("foo",25,{"duration":1})'
]

{ #category : #tests }
SUEffectTest >> testToggle [
	self
		assert: self effect toggleAppear
		equals: 'Effect.toggle(this,"Appear")'.
	self
		assert: (self effect id: 'foo'; toggleSlide)
		equals: 'Effect.toggle("foo","Slide")'.
	self
		assert: (self effect fps: 15; toggleBlind)
		equals: 'Effect.toggle(this,"Blind",{"fps":15})'
]

{ #category : #tests }
SUEffectTest >> testTween [
	self
		assert: (self effect tweenFrom: 5 to: 0 using: 'blech')
		equals: 'new Effect.Tween(this,5,0,"blech")'
]
