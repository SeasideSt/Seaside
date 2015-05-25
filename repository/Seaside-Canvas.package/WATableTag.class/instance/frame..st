attributes
frame: aString
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