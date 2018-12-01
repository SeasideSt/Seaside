Class {
	#name : #JQEffectTest,
	#superclass : #JQueryUiTest,
	#category : 'JQuery-Tests-UI-Unit'
}

{ #category : #accessing }
JQEffectTest >> effect [
	^ (self jQuery: 'div') effect
]

{ #category : #tests }
JQEffectTest >> testComplete [
	self
		assert: (self effect hide; blind; onComplete: (self javascript alert: 'Done'))
		equals: self function , '("div").hide("blind",{},null,function(){alert("Done")})'.
	self
		assert: (self effect show; blind; normal; onComplete: (self javascript alert: 'Done'))
		equals: self function , '("div").show("blind",{},"normal",function(){alert("Done")})'

]

{ #category : #tests }
JQEffectTest >> testEffects [
	self
		assert: self effect
		equals: self function , '("div").effect("highlight")'.
	self
		assert: self effect bounce
		equals: self function , '("div").effect("bounce")'.
	self
		assert: self effect highlight
		equals: self function , '("div").effect("highlight")'.
	self
		assert: self effect shake
		equals: self function , '("div").effect("shake")'.
	self
		assert: self effect size
		equals: self function , '("div").effect("size")'.
	self
		assert: self effect transfer
		equals: self function , '("div").effect("transfer")'
]

{ #category : #tests }
JQEffectTest >> testHide [
	self
		assert: (self effect hide; blind)
		equals: self function , '("div").hide("blind")'.
	self
		assert: (self effect hide; clip)
		equals: self function , '("div").hide("clip")'.
	self
		assert: (self effect hide; drop)
		equals: self function , '("div").hide("drop")'.
	self
		assert: (self effect hide; explode)
		equals: self function , '("div").hide("explode")'.
	self
		assert: (self effect hide; fold)
		equals: self function , '("div").hide("fold")'.
	self
		assert: (self effect hide; puff)
		equals: self function , '("div").hide("puff")'.
	self
		assert: (self effect hide; pulsate)
		equals: self function , '("div").hide("pulsate")'.
	self
		assert: (self effect hide; scale)
		equals: self function , '("div").hide("scale")'.
	self
		assert: (self effect hide; slide)
		equals: self function , '("div").hide("slide")'
]

{ #category : #tests }
JQEffectTest >> testShow [
	self
		assert: (self effect show; blind)
		equals: self function , '("div").show("blind")'.
	self
		assert: (self effect show; clip)
		equals: self function , '("div").show("clip")'.
	self
		assert: (self effect show; drop)
		equals: self function , '("div").show("drop")'.
	self
		assert: (self effect show; explode)
		equals: self function , '("div").show("explode")'.
	self
		assert: (self effect show; fold)
		equals: self function , '("div").show("fold")'.
	self
		assert: (self effect show; puff)
		equals: self function , '("div").show("puff")'.
	self
		assert: (self effect show; pulsate)
		equals: self function , '("div").show("pulsate")'.
	self
		assert: (self effect show; scale)
		equals: self function , '("div").show("scale")'.
	self
		assert: (self effect show; slide)
		equals: self function , '("div").show("slide")'
]

{ #category : #tests }
JQEffectTest >> testSpeed [
	self
		assert: (self effect show; blind; speed: 2 seconds)
		equals: self function , '("div").show("blind",{},2000)'.
	self
		assert: (self effect show; blind; slow)
		equals: self function , '("div").show("blind",{},"slow")'.
	self
		assert: (self effect show; blind; normal)
		equals: self function , '("div").show("blind",{},"normal")'.
	self
		assert: (self effect show; blind; fast)
		equals: self function , '("div").show("blind",{},"fast")'
]

{ #category : #tests }
JQEffectTest >> testToggles [
	self
		assert: (self effect toggle; blind)
		equals: self function , '("div").toggle("blind")'.
	self
		assert: (self effect toggle; clip)
		equals: self function , '("div").toggle("clip")'.
	self
		assert: (self effect toggle; drop)
		equals: self function , '("div").toggle("drop")'.
	self
		assert: (self effect toggle; explode)
		equals: self function , '("div").toggle("explode")'.
	self
		assert: (self effect toggle; fade)
		equals: self function , '("div").toggle("fade")'.
	self
		assert: (self effect toggle; fold)
		equals: self function , '("div").toggle("fold")'.
	self
		assert: (self effect toggle; puff)
		equals: self function , '("div").toggle("puff")'.
	self
		assert: (self effect toggle; pulsate)
		equals: self function , '("div").toggle("pulsate")'.
	self
		assert: (self effect toggle; scale)
		equals: self function , '("div").toggle("scale")'.
	self
		assert: (self effect toggle; slide)
		equals: self function , '("div").toggle("slide")'
]
