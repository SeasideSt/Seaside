"
The <table> tag defines a table. Inside a <table> tag you can put table headers, table rows, table cells, and other tables.
"
Class {
	#name : #WATableTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WATableTag >> cellpadding: anInteger [
	self attributes at: 'cellpadding' put: anInteger
]

{ #category : #attributes }
WATableTag >> cellspacing: anInteger [
	self attributes at: 'cellspacing' put: anInteger
]

{ #category : #attributes }
WATableTag >> frame: aString [
	"frame = void|above|below|hsides|lhs|rhs|vsides|box|border [CI]
    This attribute specifies which sides of the frame surrounding a table will be visible. Possible values:

        * void: No sides. This is the default value.
        * above: The top side only.
        * below: The bottom side only.
        * hsides: The top and bottom sides only.
        * vsides: The right and left sides only.
        * lhs: The left-hand side only.
        * rhs: The right-hand side only.
        * box: All four sides.
        * border: All four sides."

	self attributes at: 'frame' put: aString
]

{ #category : #attributes }
WATableTag >> rules: aString [
	"rules = none|groups|rows|cols|all [CI]
    This attribute specifies which rules will appear between cells within a table. The rendering of rules is user agent dependent. Possible values:

        * none: No rules. This is the default value.
        * groups: Rules will appear between row groups (see THEAD, TFOOT, and TBODY) and column groups (see COLGROUP and COL) only.
        * rows: Rules will appear between rows only.
        * cols: Rules will appear between columns only.
        * all: Rules will appear between all rows and columns."
	self attributes at: 'rules' put: aString
]

{ #category : #attributes }
WATableTag >> summary: aString [
	self attributes at: 'summary' put: aString
]

{ #category : #accessing }
WATableTag >> tag [
	^ 'table'
]
