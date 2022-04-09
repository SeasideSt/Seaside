accessing-dynamic
newDocument
	"Answer a new Document configured to write onto our Response's stream using the
	current Codec. Try to use the Document class specified by the closest Handler
	but fall back on WAHtmlDocument if there is none."

	^ self newDocumentOn: self response stream