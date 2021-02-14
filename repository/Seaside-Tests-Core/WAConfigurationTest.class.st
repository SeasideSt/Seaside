Class {
	#name : #WAConfigurationTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-Configuration'
}

{ #category : #accessing }
WAConfigurationTest >> basicSystemConfiguration [
	^ WAConfigurationMock new
		description: [ :config | (config string: #a) default: #default ];
		yourself
]

{ #category : #tests }
WAConfigurationTest >> testCircular [
	"Circular ancestry graphs are not allowed."
	| first second third |
	first := WAUserConfiguration new.
	second := WAUserConfiguration new
		addParent: first;
		yourself.
	third := WAUserConfiguration new
		addParent: second;
		yourself.
	self 
		should: [ first addParent: third ]
		raise: Error.
	self 
		should: [ first addParent: first ]
		raise: Error
]

{ #category : #tests }
WAConfigurationTest >> testCollectionInheritance [
	"Collection values assigned with #at:addAll: should add on to the inherited value."
	| empty root one two three four |
	empty := WAConfigurationMock new
		description: [ :config | (config collection: #a) ];
		yourself.
	root := WAConfigurationMock new
		description: [ :config | (config collection: #a) default: #(1 2) ];
		yourself.
	one := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(3) removeAll: #(2) ];
		parents: [ Array with: root ];
		yourself.
	two := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(1 2 3 4) ];
		parents: [ Array with: one ];
		yourself.
	three := WAUserConfiguration new
		addParent: two;
		at: #a addAll: #(4 5) removeAll: #(1 8);
		yourself.
	four := WAConfigurationMock new
		description: [ :config | config at: #a addAll: #(3 4) removeAll: #(2 3) ];
		parents: [ Array with: one ];
		yourself.

	self assert: (empty at: #a) = #().
	self assert: (root at: #a) = #(1 2).
	self assert: (one at: #a) = #(1 3).
	self assert: (two at: #a) = #(1 2 3 4).
	self assert: (three at: #a) = #(2 3 4 5).
	self assert: (four at: #a) = #(1 3 4)
]

{ #category : #tests }
WAConfigurationTest >> testDefaultNeverOverrides [
	"A default value should never override a specified value, even if the default is inherited from a later parent."
	| root withValue withoutValue withThenWithout withoutThenWith |
	root := self basicSystemConfiguration.
	withValue := WAUserConfiguration new
		addParent: root;
		yourself.
	withValue 
		at: #a
		put: #value.
	withoutValue := WAUserConfiguration new
		addParent: root;
		yourself.
	withThenWithout := WAUserConfiguration new
		addParent: withValue;
		addParent: withoutValue;
		yourself.
	withoutThenWith := WAUserConfiguration new
		addParent: withoutValue;
		addParent: withValue;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (withValue at: #a) = #value.
	self assert: (withoutValue at: #a) = #default.
	self assert: (withThenWithout at: #a) = #value.
	self assert: (withoutThenWith at: #a) = #value
]

{ #category : #tests }
WAConfigurationTest >> testHasExpressionAt [
	| root user child |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	self deny: (user hasExpressionAt: #a).
	user at: #a put: 2.
	self assert: (user hasExpressionAt: #a).
	child := WAUserConfiguration new
		addParent: user;
		yourself.
	self deny: (child hasExpressionAt: #a)
]

{ #category : #tests }
WAConfigurationTest >> testLastAddedOverrides [
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
]

{ #category : #tests }
WAConfigurationTest >> testLastAddedOverrides2 [
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
]

{ #category : #tests }
WAConfigurationTest >> testOverrides [
	"A value in a configuration should override all those given by its ancestors."
	| root one two three four system five |
	root := self basicSystemConfiguration.
	one := WAUserConfiguration new
		addParent: root;
		yourself.
	two := WAUserConfiguration new
		addParent: one;
		yourself.
	two at: #a put: 2.
	system := WAConfigurationMock new
		description: [ :config | config at: #a put: #override ];
		parents: [ Array with: two ];
		yourself.
	three := WAUserConfiguration new
		addParent: system;
		yourself.
	four := WAUserConfiguration new
		addParent: three;
		yourself.
	four at: #a put: 4.
	five := WAUserConfiguration new
		addParent: four;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (one at: #a) = #default.
	self assert: (two at: #a) = 2.
	self assert: (system at: #a) = #override.
	self assert: (three at: #a) = #override.
	self assert: (four at: #a) = 4.
	self assert: (five at: #a) = 4
]

{ #category : #tests }
WAConfigurationTest >> testSearchContextsCaching [
	"Search contexts should be cached after accessing them for the first time. Also the cache should be empty after clearSearchContexts."
	| root user |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') = 'testingSearchContextsCache'.
	user at: #a.
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') attribute default = #default .
	user clearSearchContexts.
	self assert: (user retrieveSearchContext: #a default: 'testingSearchContextsCache') = 'testingSearchContextsCache'
]

{ #category : #tests }
WAConfigurationTest >> testValueWithoutAttribute [
	"A user configuration should not be able to provide a value if it does not inherit the attribute."
	| root user top mirror |
	root := self basicSystemConfiguration.
	user := WAUserConfiguration new
		addParent: root;
		yourself.
	user 
		at: #a
		put: 1.
	user removeParent: root.
	top := WAUserConfiguration new
		addParent: root;
		addParent: user;
		yourself.
	mirror := WAUserConfiguration new
		addParent: user;
		addParent: root;
		yourself.
	self assert: (root at: #a) = #default.
	self should: [ user at: #a ] raise: WAAttributeNotFound.
	self assert: (top at: #a) = #default.
	self assert: (mirror at: #a) = #default.
	self 
		should: 
			[ user 
				at: #a
				put: 2 ]
		raise: Error
]

{ #category : #tests }
WAConfigurationTest >> testValueWithoutAttribute2 [
	"A user configuration should not be able to provide a value if it does not inherit the attribute."
	| root top mirror user1 user2 |
	root := self basicSystemConfiguration.
	user1 := WAUserConfiguration new
		addParent: root;
		yourself.
	user1 
		at: #a
		put: 1.
	user2 := WAUserConfiguration new
		addParent: root;
		yourself.
	user2 
		at: #a
		put: 2.
	user2 removeParent: root.
	top := WAUserConfiguration new
		addParent: user1;
		addParent: user2;
		yourself.
	mirror := WAUserConfiguration new
		addParent: user2;
		addParent: user1;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (user1 at: #a) = 1.
	self should: [ user2 at: #a ] raise: WAAttributeNotFound.
	self assert: (top at: #a) = 1.
	self assert: (mirror at: #a) = 1
]

{ #category : #tests }
WAConfigurationTest >> testValueWithoutAttributeWithIfAbsentBlock [
	"A user configuration should not be able to provide a value if it does not inherit the attribute."
	| root top mirror user1 user2 absent |
	root := self basicSystemConfiguration.
	user1 := WAUserConfiguration new
		addParent: root;
		yourself.
	user1 
		at: #a
		put: 1.
	user2 := WAUserConfiguration new
		addParent: root;
		yourself.
	user2 
		at: #a
		put: 2.
	user2 removeParent: root.
	top := WAUserConfiguration new
		addParent: user1;
		addParent: user2;
		yourself.
	mirror := WAUserConfiguration new
		addParent: user2;
		addParent: user1;
		yourself.
	self assert: (root at: #a) = #default.
	self assert: (user1 at: #a) = 1.
	absent := false.
	user2 at: #a ifAbsent: [ absent := true ].
	self assert: absent.
	self assert: (top at: #a) = 1.
	self assert: (mirror at: #a) = 1
]

{ #category : #tests }
WAConfigurationTest >> testValueWithoutDefault [
	"Make sure that a configuration can specify a local value even if the attribute doesn't have a default value." 	
	| root1 root2 user |
	root1 := WAConfigurationMock new
		description: [ :config | config string: #a ];
		yourself.
	root2 := WAConfigurationMock new
		description: [ :config | config string: #b ];
		yourself.
	
	user := WAUserConfiguration new addParent: root1; addParent: root2; yourself.
	user at: #a put: 1.
	user at: #b put: 2.
	
	self assert: (root1 at: #a) isNil.
	self assert: (root2 at: #b) isNil.
	self assert: (user at: #a) = 1.
	self assert: (user at: #b) = 2
]
