Class {
	#name : #WAContinuationTest,
	#superclass : #TestCase,
	#instVars : [
		'tmp',
		'tmp2'
	],
	#category : 'Seaside-Tests-GemStone-Continuation'
}

{ #category : #utilities }
WAContinuationTest >> callcc: aBlock [
	^ WAContinuation currentDo: aBlock
]

{ #category : #tests }
WAContinuationTest >> testBlockEscape [
	| x |
	tmp := 0.
	x := [ tmp := tmp + 1. tmp2 value ].
	self callcc: [ :cc | tmp2 := cc. x value ].
	tmp2 := [ ].
	x value.
	self assert: tmp = 2
]

{ #category : #tests }
WAContinuationTest >> testBlockTemps [
	| y |
	#(1 2 3) do: [ :i |
		| x |
		x := i.
		tmp ifNil: [ tmp2 := (self callcc: [ :cc | tmp := cc. [ :q | ] ]) ].
		tmp2 value: x.
		x := 17 ].
	y := (self callcc: [ :cc | tmp value: cc. 42 ]).
	self assert: y = 1
]

{ #category : #tests }
WAContinuationTest >> testBlockVars [
	| continuation |
	tmp := 0.
	tmp := (self callcc: [ :cc | continuation := cc. 0 ]) + tmp.
	tmp2 isNil
		ifFalse: [ tmp2 value ]
		ifTrue: [
			#(1 2 3) do: [ :i |
				self callcc: [ :cc | tmp2 := cc. continuation value: i ] ] ].
	self assert: tmp = 6
]

{ #category : #tests }
WAContinuationTest >> testCallCCInBlock [
	| block kk captured seen result res  |
	captured := false.
	seen := false.
	block := [ | value |
		value := self callcc: [ :cc | kk := cc. captured := true ].
		seen := true.
		value ].

	(res := block value) == true
		ifTrue: [ 
			"first time through"
			self assert: captured.
			self assert: seen ].
	res = 123 
		ifTrue: [ 
			"second time through"
			self deny: captured.
			self assert: seen.
			^self ].
	captured := false.
	seen := false.
	self assert: (result := kk value: 123) = 123.
	"never get here"
	self assert: false
]

{ #category : #tests }
WAContinuationTest >> testComprehension [
	"What should this print out?

	| yin yang |
	yin := [ :x | Transcript cr. x ] value: Continuation current.
	yang := [ :x | Transcript nextPut: $*. x ] value: Continuation current.
	yin value: yang"
]

{ #category : #tests }
WAContinuationTest >> testMethodTemps [
	| i continuation |
	i := 0.
	i := i + (self callcc: [:cc | continuation := cc. 1]).
	self assert: i ~= 3.
	i = 2 ifFalse: [ continuation value: 2 ]
]

{ #category : #tests }
WAContinuationTest >> testReentrant [
	| assoc |
	assoc := self callcc: [ :cc | cc -> 0 ].
	assoc value: assoc value + 1.
	self assert: assoc value ~= 5.
	assoc value = 4
		ifFalse: [ assoc key value: assoc ]
]

{ #category : #tests }
WAContinuationTest >> testSimpleCallCC [
	| x continuation |
	x := self callcc: [ :cc | continuation := cc. false ].
	x ifFalse: [ continuation value: true ].
	self assert: x
]

{ #category : #tests }
WAContinuationTest >> testSimpleCallCCWithPossibleArgument [
	| x continuation |
	x := self callcc: [ :cc | continuation := cc. false ].
	x ifFalse: [ continuation valueWithPossibleArguments: (Array with:  true) ].
	self assert: x
]

{ #category : #tests }
WAContinuationTest >> testSimplestCallCC [
	| x |
	x := self callcc: [ :cc | cc value: true ].
	self assert: x
]
