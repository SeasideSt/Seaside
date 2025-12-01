"
The <wbr> (Word Break Opportunity) tag specifies where in a text it would be ok to add a line-break.
"
Class {
	#name : 'WAOptionalBreakTag',
	#superclass : 'WATagBrush',
	#category : 'Seaside-Canvas-Tags',
	#package : 'Seaside-Canvas',
	#tag : 'Tags'
}

{ #category : 'testing' }
WAOptionalBreakTag >> isClosed [
	^ true
]

{ #category : 'accessing' }
WAOptionalBreakTag >> tag [
	^ 'wbr'
]
