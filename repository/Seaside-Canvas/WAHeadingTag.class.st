"
A heading element briefly describes the topic of the section it introduces. Heading information may be used by user agents, for example, to construct a table of contents for a document automatically.

There are six levels of headings in HTML with H1 as the most important and H6 as the least. Visual browsers usually render more important headings in larger fonts than less important ones.
"
Class {
	#name : #WAHeadingTag,
	#superclass : #WATagBrush,
	#instVars : [
		'level'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #initialization }
WAHeadingTag >> initialize [
	super initialize.
	self level1
]

{ #category : #accessing }
WAHeadingTag >> level [
	^ level
]

{ #category : #convenience }
WAHeadingTag >> level1 [
	level := 1
]

{ #category : #convenience }
WAHeadingTag >> level2 [
	level := 2
]

{ #category : #convenience }
WAHeadingTag >> level3 [
	level := 3
]

{ #category : #convenience }
WAHeadingTag >> level4 [
	level := 4
]

{ #category : #convenience }
WAHeadingTag >> level5 [
	level := 5
]

{ #category : #convenience }
WAHeadingTag >> level6 [
	level := 6
]

{ #category : #accessing }
WAHeadingTag >> level: anInteger [
	level := (anInteger max: 1) min: 6
]

{ #category : #accessing }
WAHeadingTag >> tag [
	^ 'h' , self level greaseString
]
