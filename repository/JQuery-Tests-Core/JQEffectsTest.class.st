Class {
	#name : #JQEffectsTest,
	#superclass : #JQueryTest,
	#category : 'JQuery-Tests-Core-Unit'
}

{ #category : #accessing }
JQEffectsTest >> animate [
	^ self target animate
]

{ #category : #accessing }
JQEffectsTest >> target [
	^ self jQuery: 'div'
]

{ #category : #'tests-animation' }
JQEffectsTest >> testAnimateEvents [
	self
		assert: (self animate onComplete: self mock)
		equals: self function , '("div").animate({},{"complete":function(){mock}})'.
	self
		assert: (self animate onStep: self mock)
		equals: self function , '("div").animate({},{"step":function(){mock}})'
]

{ #category : #'tests-animation' }
JQEffectsTest >> testAnimateOptions [
	self
		assert: (self animate duration: 5 seconds)
		equals: self function , '("div").animate({},{"duration":5000})'.
	self
		assert: (self animate easing: 'linear')
		equals: self function , '("div").animate({},{"easing":"linear"})'.
	self
		assert: (self animate queue: false)
		equals: self function , '("div").animate({},{"queue":false})'
]

{ #category : #'tests-animation' }
JQEffectsTest >> testAnimateParams [
	self 
		assert: (self animate parameters: Dictionary new)
		equals: self function , '("div").animate({},{})'.
	self
		assert: (self animate width: 200; padding: 50; opacity: 'hide')
		equals: self function , '("div").animate({"width":200,"padding":50,"opacity":"hide"},{})'.
	self
		assert: (self animate height: 'toggle'; left: '+=100')
		equals: self function , '("div").animate({"height":"toggle","left":"+=100"},{})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testFadeIn [
	self 
		assert: (self target fadeIn: 3 seconds)
		equals: self function , '("div").fadeIn(3000)'.
	self 
		assert: (self target fadeIn: 4 seconds callback: 'done')
		equals: self function , '("div").fadeIn(4000,function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testFadeOut [
	self 
		assert: (self target fadeOut: 5 seconds)
		equals: self function , '("div").fadeOut(5000)'.
	self 
		assert: (self target fadeOut: 6 seconds callback: 'done')
		equals: self function , '("div").fadeOut(6000,function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testFadeTo [
	self 
		assert: (self target fade: 1 seconds to: 0.8)
		equals: self function , '("div").fadeTo(1000,0.8)'.
	self 
		assert: (self target fade: 2 seconds to: 0.4 callback: 'done')
		equals: self function , '("div").fadeTo(2000,0.4,function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testFadeToggle [
	self 
		assert: (self target fadeToggle: 'slow')
		equals: self function , '("div").fadeToggle("slow")'.
	self 
		assert: (self target fadeToggle: 'fast' callback: 'done')
		equals: self function , '("div").fadeToggle("fast",function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testHide [
	self 
		assert: (self target hide)
		equals: self function , '("div").hide()'.
	self 
		assert: (self target hide: 'slow')
		equals: self function , '("div").hide("slow")'.
	self 
		assert: (self target hide: 'fast' callback: 'done')
		equals: self function , '("div").hide("fast",function(){done})'
]

{ #category : #tests }
JQEffectsTest >> testId [
	self 
		assert: (self target animate width: 100; queue: false; id: 'foo')
		equals: self function , '("#foo").animate({"width":100},{"queue":false})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testShow [
	self 
		assert: (self target show)
		equals: self function , '("div").show()'.
	self 
		assert: (self target show: 'slow')
		equals: self function , '("div").show("slow")'.
	self 
		assert: (self target show: 'fast' callback: 'done')
		equals: self function , '("div").show("fast",function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testSlideDown [
	self 
		assert: (self target slideDown: 'slow')
		equals: self function , '("div").slideDown("slow")'.
	self 
		assert: (self target slideDown: 'fast' callback: 'done')
		equals: self function , '("div").slideDown("fast",function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testSlideToggle [
	self 
		assert: (self target slideToggle: 'slow')
		equals: self function , '("div").slideToggle("slow")'.
	self 
		assert: (self target slideToggle: 'fast' callback: 'done')
		equals: self function , '("div").slideToggle("fast",function(){done})'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testSlideUp [
	self 
		assert: (self target slideUp: 'slow')
		equals: self function , '("div").slideUp("slow")'.
	self 
		assert: (self target slideUp: 'fast' callback: 'done')
		equals: self function , '("div").slideUp("fast",function(){done})'
]

{ #category : #tests }
JQEffectsTest >> testStop [
	self 
		assert: (self target stop)
		equals: self function , '("div").stop()'
]

{ #category : #'tests-effects' }
JQEffectsTest >> testToggle [
	self 
		assert: (self target toggle)
		equals: self function , '("div").toggle()'.
	self 
		assert: (self target toggle: 'slow')
		equals: self function , '("div").toggle("slow")'.
	self 
		assert: (self target toggle: 'fast' callback: 'done')
		equals: self function , '("div").toggle("fast",function(){done})'
]
