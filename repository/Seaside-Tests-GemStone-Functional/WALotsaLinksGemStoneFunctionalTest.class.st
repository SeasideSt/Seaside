Class {
	#name : #WALotsaLinksGemStoneFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-GemStone-Functional'
}

{ #category : #private }
WALotsaLinksGemStoneFunctionalTest >> callbackBlockFor: each [

	^[ self 
			inform: each
			onAnswer: [ :v | self session jumpToAnchor: each greaseString ] ]
]

{ #category : #rendering }
WALotsaLinksGemStoneFunctionalTest >> renderContentOn: html [ 
	self renderExplanationOn: html.
	html unorderedList: 
		[ 1 
			to: 5000
			do: 
				[ :each | 
				html listItem: 
					[ html anchor
						name: each greaseString;
						callback: (self callbackBlockFor: each);
						with: each ] ] ]
]

{ #category : #rendering }
WALotsaLinksGemStoneFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This is a GemStone-specific version of the WALotsaLinksFunctionalTest that implements a workaround for a GemStone/S bug.'.
	html paragraph: 'In GemStone/S 2.x, block temporaries are shared across invocations of a nested block. This bug is especially noticeable in Seaside when the #callback: block is nested in a #do: loop. You can see the incorrect behavior when you run the WALotsaLinksFunctionalTest - the link label is correct, but the value for every link is 5000, the last value in the loop.'.
	html paragraph: 'The workaround is to embed the #callback: block in a separate method call.'.
	html paragraph: 'In GemStone/S 3.x the WALotsaLinksFunctionalTest should function correctly'
]
