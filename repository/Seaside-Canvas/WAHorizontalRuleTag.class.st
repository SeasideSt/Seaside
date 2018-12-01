"
The HR element causes a horizontal rule to be rendered by visual user agents.

The amount of vertical space inserted between a rule and the content that surrounds it depends on the user agent.
"
Class {
	#name : #WAHorizontalRuleTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #testing }
WAHorizontalRuleTag >> isClosed [
	^ true
]

{ #category : #accessing }
WAHorizontalRuleTag >> tag [
	^ 'hr'
]
