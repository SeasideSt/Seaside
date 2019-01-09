tests
testLastAddedOverrides2
	"If a non-default value is inherited from more than one parent, the one from the last parent in the list should take precedence.
	
	These are the two graphs we are talking about (X means no value specified):
    top                mirror
    / \                  |   |
    |  2                 2   |
    | /                    \ |
    1                       1
    |                        |  
  root                    root
"
	| root top mirror one two |
	root := self basicSystemConfiguration.
	one := WAUserConfiguration new
		addParent: root;
		yourself.
	one 
		at: #a
		put: 1.
	two := WAUserConfiguration new
		addParent: one;
		yourself.
	two 
		at: #a
		put: 2.
	top := WAUserConfiguration new
		addParent: one;
		addParent: two;
		yourself.
	mirror := WAUserConfiguration new
		addParent: two;
		addParent: one;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (one at: #a) = 1.
	self assert: (two at: #a) = 2.
	self assert: (top at: #a) = 2.
	self assert: (mirror at: #a) = 1