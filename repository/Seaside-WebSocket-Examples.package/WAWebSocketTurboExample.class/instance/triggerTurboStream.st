accessing
triggerTurboStream

	self pusher turboStream: [ :ts | ts append: #text with: [:innerHtml | innerHtml text: 'foobar' ] ]