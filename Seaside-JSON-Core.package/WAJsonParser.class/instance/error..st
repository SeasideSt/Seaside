private
error: aString
	"Raise a parse error labelled aString."

	^ WAJsonSyntaxError signal: aString