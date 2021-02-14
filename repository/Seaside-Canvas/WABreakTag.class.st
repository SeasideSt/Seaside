"
The BR element forcibly breaks (ends) the current line of text. Authors are advised to use style sheets to control text flow around floating images and other objects.

Prohibiting a line break 

Sometimes authors may want to prevent a line break from occurring between two words. The &nbsp; entity (&#160; or &#xA0;) acts as a space where user agents should not cause a line break.
"
Class {
	#name : #WABreakTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #testing }
WABreakTag >> isClosed [
	^ true
]

{ #category : #accessing }
WABreakTag >> tag [
	^ 'br'
]
