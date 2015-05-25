private
shouldRedirect
	| request |
	request := self request.
	^ (request isGet and: [ request fields includesKey: '_n' ]) not