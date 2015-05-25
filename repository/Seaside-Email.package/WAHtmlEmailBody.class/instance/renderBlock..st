as yet unclassified
renderBlock: anHtmlRenderingBlock
	self
		contentString:
			(WAHtmlCanvas builder
				fullDocument: true;
				render: anHtmlRenderingBlock)