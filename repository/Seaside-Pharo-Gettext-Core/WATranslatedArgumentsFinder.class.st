Class {
	#name : #WATranslatedArgumentsFinder,
	#superclass : #WAObject,
	#category : 'Seaside-Pharo-Gettext-Core'
}

{ #category : #accessing }
WATranslatedArgumentsFinder >> translatedArguments [
	"self new translatedArguments"
	| searcher currentClass result innerMatchHandler extractFirstArgument extractReceiver |
	currentClass := WAValueHolder with: nil.
	result := GROrderedMultiMap new.
	innerMatchHandler := [ :node :literal |
		| key |
		key := (currentClass contents compiledMethodAt: node methodNode selector) asFullRingDefinition.
		result at: key add: literal value ].
	extractFirstArgument := [ :node :answer |
		| firstArgument |
		firstArgument := node arguments first.
		firstArgument isLiteralNode ifTrue: [
			innerMatchHandler value: node value: firstArgument ] ].
	extractReceiver := [ :node :answer |
		node receiver isLiteralNode ifTrue: [
			innerMatchHandler value: node value: node receiver ] ].
	searcher := RBParseTreeSearcher new
		matches: '`@object translate: `#string' do: extractFirstArgument;
		matches: '`@object translate: `#string to: `@arg' do: extractFirstArgument;
		matches: '`#string seasideTranslated' do: extractReceiver;
		matches: '`#string seasideLazyTranslated' do: extractReceiver;
		matches: '`#string seasideTranslatedTo: `@arg' do: extractReceiver;
		yourself.
	(RBBrowserEnvironment new allNonMetaClasses, RBBrowserEnvironment new allMetaClasses) do:[:class |
		class selectors do:[:selector |
			(searcher canMatchMethod: class >> selector) ifTrue: [
				| tree |
				(tree := class parseTreeFor: selector) notNil ifTrue: [
					currentClass contents: class.
					searcher executeTree: tree ] ] ] ].
	^ Array streamContents: [ :stream |
		result keysDo: [ :key |
			stream nextPut: key -> (result allAt: key) ] ]
]
