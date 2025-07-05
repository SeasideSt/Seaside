instance creation
on: aWAHtmlCanvas render: microDownString

	^ (self new canvas: aWAHtmlCanvas) visit: (Microdown parse: microDownString)