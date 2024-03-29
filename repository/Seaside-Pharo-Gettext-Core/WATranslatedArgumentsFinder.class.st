Class {
	#name : 'WATranslatedArgumentsFinder',
	#superclass : 'WAObject',
	#category : 'Seaside-Pharo-Gettext-Core',
	#package : 'Seaside-Pharo-Gettext-Core'
}

{ #category : 'accessing' }
WATranslatedArgumentsFinder >> translatedArguments [
	^ self translatedArguments: nil.
]

{ #category : 'accessing' }
WATranslatedArgumentsFinder >> translatedArguments: classesToSelect [

	| env |
	env := classesToSelect
		       ifNil: [ RBBrowserEnvironment new forClasses: RBBrowserEnvironment new allNonMetaClasses, RBBrowserEnvironment new allMetaClasses ]
		       ifNotNil: [ RBBrowserEnvironment new forClasses: classesToSelect ].
	^ self translatedArgumentsIn: env
]

{ #category : 'accessing' }
WATranslatedArgumentsFinder >> translatedArgumentsIn: aRBBrowserEnvironment [

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
	aRBBrowserEnvironment methodsDo:[ :method |
			(searcher canMatchMethod:method) ifTrue: [
				| tree |
				(tree := method parseTree) notNil ifTrue: [
					currentClass contents: method methodClass.
					searcher executeTree: tree ] ] ].
	^ Array streamContents: [ :stream |
		result keysDo: [ :key |
			stream nextPut: key -> (result allAt: key) ] ]
]
