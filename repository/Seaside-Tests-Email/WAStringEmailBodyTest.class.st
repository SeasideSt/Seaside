Class {
	#name : #WAStringEmailBodyTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Email'
}

{ #category : #tests }
WAStringEmailBodyTest >> testBasics [
	| body |
	body := WAStringEmailBody contentString: 'hello'.
	self assert: body isPlainText.
	self assert: body contentString equals: 'hello'.
	self assert: body contentType equals:WAMimeType textPlain
]

{ #category : #tests }
WAStringEmailBodyTest >> testCrLf [
	| cr lf crlf body |
	cr := String with: Character cr.
	lf := String with: Character lf.
	crlf := cr , lf.
	body := WAStringEmailBody contentString: 'hello' , crlf , 'world'.
	self assert: ('hello' , cr , 'world') = body greaseString
]

{ #category : #tests }
WAStringEmailBodyTest >> testSplitIntoLines [
	| cr toSplit actual |
	cr := String with: Character cr.
	
	toSplit := cr, cr, 'a', cr, cr.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 5.
	#('' '' 'a' '' '') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ].
	
	toSplit := cr, cr, 'a', cr.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 4.
	#('' '' 'a' '') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ].
	
	toSplit := cr, cr, 'a'.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 3.
	#('' '' 'a') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ]
]

{ #category : #tests }
WAStringEmailBodyTest >> testWrapping [
	| cr body lf crlf |
	cr := String with: Character cr.
	lf := String with: Character lf.
	crlf := cr , lf.
	body := WAStringEmailBody 
		string: '1111 222 2 33'
		lineLength: 5.
	self assert: ('1111' , cr , '222 2' , cr , '33') = body greaseString.
	body := WAStringEmailBody 
		string: '0123456789'
		lineLength: 5.
	self assert: ('01234' , cr , '56789') = body greaseString.
	body := WAStringEmailBody 
		string: '012345678'
		lineLength: 5.
	self assert: ('01234' , cr , '5678') = body greaseString.
	body := WAStringEmailBody 
		string: '01234567890'
		lineLength: 5.
	self assert: ('01234' , cr , '56789' , cr , '0') = body greaseString.
	body := WAStringEmailBody 
		string: '0123456789' , crlf , crlf , '0123456789'
		lineLength: 5.
	self assert: ('01234' , cr , '56789' , cr , cr , '01234' , cr , '56789') = body greaseString
]
