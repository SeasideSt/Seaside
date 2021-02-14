Class {
	#name : #JSConversionTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #tests }
JSConversionTest >> testArray [
	self assert: #(1 2 3) equals: '[1,2,3]'.
	self assert: (GRSmallOrderedSet withAll: #(1 2 3)) equals: '[1,2,3]'
]

{ #category : #tests }
JSConversionTest >> testCharacter [
	self assert: (Character codePoint: 0) equals: '"\0"'.
	self assert: Character lf equals: '"\n"'.
	self assert: $a equals: '"a"'
]

{ #category : #tests }
JSConversionTest >> testDateAndTime [
	self assert: (DateAndTime year: 1980 month: 6 day: 11 hour: 12 minute: 45 second: 23) equals: 'new Date(1980,5,11,12,45,23)'.
	self assert: (Date year: 1980 month: 6 day: 11) equals: 'new Date(1980,5,11)'
]

{ #category : #tests }
JSConversionTest >> testDictionary [
	self 
		assert: (GRSmallDictionary2 new
				at: 'foo'
					put: 1;
				at: 'bar'
					put: 2;
				at: 'zork'
					put: 3;
				yourself)
		equals: '{"foo":1,"bar":2,"zork":3}'.
	self 
		assert: (GRSmallDictionary2 new
				at: ''
					put: 'empty';
				yourself)
		equals: '{"":"empty"}'.
	self 
		assert: (Dictionary new
				at: 1
					put: 'not-a-string';
				yourself)
		equals: '{"1":"not-a-string"}'.
	self 
		assert: (Dictionary new
				at: '1abc'
					put: 'not-an-id';
				yourself)
		equals: '{"1abc":"not-an-id"}'.
	self 
		assert: (Dictionary new
				at: 'abc1'
					put: 'totally sexy';
				yourself)
		equals: '{"abc1":"totally sexy"}'
]

{ #category : #tests }
JSConversionTest >> testDuration [
	self assert: (Duration seconds: 1) equals: '1000'.
	self assert: (Duration milliseconds: 1200) equals: '1200'
]

{ #category : #'tests-tools' }
JSConversionTest >> testIsJavascript [
	self deny: 123 isJavascript.
	self assert: self mock isJavascript.
	self assert: JSCreate new isJavascript
]

{ #category : #tests }
JSConversionTest >> testJoinAssocation [
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> nil)) 
		equals: '"foo"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> true)) 
		equals: '"foo="+encodeURIComponent(true)'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 123)) 
		equals: '"foo="+encodeURIComponent(123)'
]

{ #category : #tests }
JSConversionTest >> testJoinEmpty [
	self 
		assert: (JSJoin new)
		equals: '""'
]

{ #category : #tests }
JSConversionTest >> testJoinMultiple [
	self
		assert: (JSJoin on: #('foo')) 
		equals: '"foo"'.
	self
		assert: (JSJoin on: #('foo' 'bar'))
		equals: '["foo","bar"].join("&")'
]

{ #category : #tests }
JSConversionTest >> testJoinString [
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar')) 
		equals: '"foo=bar"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar zork')) 
		equals: '"foo=bar%20zork"'.
	self
		assert: (JSJoin on: (OrderedCollection with: 'foo' -> 'bar&zork')) 
		equals: '"foo=bar%26zork"'
]

{ #category : #tests }
JSConversionTest >> testLiteral [
	self assert: true equals: 'true'.
	self assert: false equals: 'false'.
	self assert: nil equals: 'null'
]

{ #category : #tests }
JSConversionTest >> testNumber [
	self assert: 123 equals: '123'.
	self assert: Float nan equals: 'NaN'.
	self assert: Float infinity equals: 'Infinity'.
	self assert: Float infinity * -1 equals: '-Infinity'
]

{ #category : #tests }
JSConversionTest >> testStringBasic [
	self assert: 'abc' equals: '"abc"'.
	self assert: '123' equals: '"123"'
]

{ #category : #tests }
JSConversionTest >> testStringEscaping [
	self assert: '''' equals: '"''"'.
	self assert: '"' equals: '"\""'.
	self assert: '\' equals: '"\\"'
]

{ #category : #tests }
JSConversionTest >> testStringSpecial [
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.

	self assert: (String with: (Character codePoint: 0)) equals: '"\0"'.
	self assert: (String with: (Character codePoint: 1)) equals: '"\x01"'.
	self assert: (String with: (Character codePoint: 31)) equals: '"\x1f"'
]

{ #category : #tests }
JSConversionTest >> testStringSpecialLineTerminator [
	"
		ECMA-262 v5.1 (June 2011) section 7.8.4 says that string literals cannot contain an unescaped LineTerminator, which is defined in
		section 7.3 as the four characters <LF>, <CR>,  <LS> and  <PS> (U+000A, U+u000D, U+2028 and U+2029)
		
		See also:
			http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf
			http://timelessrepo.com/json-isnt-a-javascript-subset
	"

	"<LF>"
	self assert: (String with: (Character codePoint: 16r000A)) equals: '"\n"'.
	
	"<CR>"
	self assert: (String with: (Character codePoint: 16r000D)) equals: '"\r"'.
	
	"<LS>"
	self assert: (String with: (Character codePoint: 16r2028)) equals: '"\u2028"'.
	
	"<PS>"
	self assert: (String with: (Character codePoint: 16r2029)) equals: '"\u2029"'
]

{ #category : #tests }
JSConversionTest >> testUrl [
	self
		assert: (WAUrl absolute: 'http://www.seaside.st/?1=a&2=b')
		equals: '"http://www.seaside.st/?1=a&2=b"'
]
