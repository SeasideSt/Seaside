private
sanitizePath: aString
	"Make sure aString follows https://tools.ietf.org/html/rfc6265#section-5.1.4 rules"
	| sanitized |
	sanitized := aString.
	(#(nil '' '/') includes: sanitized) ifTrue: [
		"treat nil '' '/' all as '/"
		sanitized := '/' ].
	"make sure path starts with /"
	sanitized first = $/ ifFalse: [
		sanitized := '/', sanitized ].
	"make sure path does not end with /"
	[ sanitized size > 1 and: [ sanitized last = $/ ] ] whileTrue: [ 
		sanitized := sanitized allButLast ].
	^ sanitized