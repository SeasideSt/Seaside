Class {
	#name : #WAPrettyPrintedDocumentTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Development'
}

{ #category : #testing }
WAPrettyPrintedDocumentTest >> assert: anObject rendersAs: aString [
	| oldContext document newContext stream |
	stream := WriteStream on: String new.
	oldContext := WARenderContext new
		actionUrl: WAUrl new;
		document: (WAHtmlDocument on: stream);
		yourself.
	oldContext visitor: (WARenderingGuide client: (WARenderVisitor context: oldContext)).
	newContext := oldContext copy.
	newContext disableHalos.
	document := WAPrettyPrintedDocument context: oldContext.
	newContext document: document.
	(WARenderVisitor context: newContext) start: anObject. "from tools-web should be in dependency list"
	newContext document close.
	self assert: aString equals: stream contents
]

{ #category : #testing }
WAPrettyPrintedDocumentTest >> testEventsInKnownEvents [
	"Test that any event on WATagBrush is in WAPrettyPrintedDocument >> #knownEvents"
	| selectors eventNames knownEvents |
	selectors :=  WATagBrush selectors select: [ :each |
		(each beginsWithSubCollection: #on)
			and: [ each ~= #onEnter: ] ].
	eventNames := selectors collect: [ :each |
		each = #onDoubleClick:
			ifTrue: [ 'ondblclick' ]
			ifFalse: [ each allButLast asLowercase ] ].
	knownEvents := WAPrettyPrintedDocument basicNew knownEvents.
	eventNames do: [ :each |
		self assert: (knownEvents includes: each) ]
]

{ #category : #testing }
WAPrettyPrintedDocumentTest >> testKnownEventsInTagBrush [
	"Test that any event in WAPrettyPrintedDocument >> #knownEvents is on WATagBrush"
	| knownEvents |
	knownEvents := WAPrettyPrintedDocument basicNew knownEvents.
	knownEvents do: [ :each |
		| selector |
		selector := each = 'ondblclick'
			ifTrue: [ #onDoubleClick: ]
			ifFalse: [
				WATagBrush selectors detect: [ :eachSelector |
				eachSelector allButLast asLowercase greaseString = each ] ].
		self assert: selector notNil ]
]

{ #category : #testing }
WAPrettyPrintedDocumentTest >> testRendering [
	self
		assert: WAPrettyPrintedDocumentTestComponent new
		rendersAs: '&lt;<span class="wa-tag">h1</span>&nbsp;<span class="wa-attribute-key">title</span>=<span class="wa-attribute-value">&quot;&amp;amp;foo;&quot;</span>&gt;&amp;amp;foo;&lt;/<span class="wa-tag">h1</span>&gt;&amp;nbsp;<br/>&lt;<span class="wa-tag">a</span>&nbsp;<span class="wa-attribute-key">disabled</span>&nbsp;<span class="wa-attribute-key">onclick</span>=<span class="wa-attribute-value">&quot;<a onclick="$(&amp;quot;#seastar&amp;quot;).animate({&amp;quot;left&amp;quot;:&amp;quot;-=100px&amp;quot;},{})">$(&amp;amp;quot;#seastar&amp;amp;quot;).animate({&amp;amp;quot;left&amp;amp;quot;:&amp;amp;quot;-=100px&amp;amp;quot;},{})</a>&quot;</span>&gt;Move Left&lt;/<span class="wa-tag">a</span>&gt;'
]
