private
pageContent
	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | self updateRoot: root ];
		render: [ :html |
			self renderContentOn: html ]