tests
testTry
	self deny: (consumer try: 'foo').
	self assert: (consumer try: 'tweets').
	self deny: (consumer try: 'tweets').
	self assert: (consumer try: 'kentbeck').
	self assert: consumer atEnd.
	self deny: (consumer try: 'kentbeck')
	