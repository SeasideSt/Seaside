accessing-dynamic
newDocumentOn: outputStream
	"Answer a new Document configured to write onto outputStream using the
	current Codec. Try to use the Document class specified by the closest Handler
	but fall back on WAHtmlDocument if there is none."


	^ self handler isNil
		  ifTrue: [ 
			  (WAHtmlDocument on: outputStream codec: self codec)
				  scriptGenerator: WADefaultScriptGenerator new;
				  yourself ]
		  ifFalse: [ 
			  (self handler documentClass on: outputStream codec: self codec)
				  scriptGenerator: self handler scriptGeneratorClass new;
				  yourself ]