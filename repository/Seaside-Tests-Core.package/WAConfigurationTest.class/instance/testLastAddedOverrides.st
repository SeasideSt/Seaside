tests
testLastAddedOverrides
	"If a non-default value is inherited from more than one parent, the one from the last parent in the list should take precedence.
	
	These are the two graphs we are talking about (X means no value specified):
  top                   mirror
  /  \                    /  \
 2    X                  X   2
 |     |                   |    |
 X    1                  1   X
  \  /                    \  /
  root                   root
"
	| root aX a2 b1 bX top mirror |
	root := self basicSystemConfiguration.
	aX := WAUserConfiguration new
		addParent: root;
		yourself.
	a2 := WAUserConfiguration new
		addParent: aX;
		yourself.
	a2 
		at: #a
		put: 2.
	b1 := WAUserConfiguration new
		addParent: root;
		yourself.
	b1 
		at: #a
		put: 1.
	bX := WAUserConfiguration new
		addParent: b1;
		yourself.
	top := WAUserConfiguration new
		addParent: a2;
		addParent: bX;
		yourself.
	mirror := WAUserConfiguration new
		addParent: bX;
		addParent: a2;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (aX at: #a) = #default.
	self assert: (a2 at: #a) = 2.
	self assert: (b1 at: #a) = 1.
	self assert: (bX at: #a) = 1.
	self assert: (top at: #a) = 1.
	self assert: (mirror at: #a) = 2