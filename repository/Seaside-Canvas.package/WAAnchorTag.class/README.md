I'm the class responsible for adding anchors (links) to your webpage. There are multiple ways of using me.

1. In the following case, the method #doSomethingOnClick will be sent to self when the user click on the anchor 'Click here to do something':

	html anchor
		callback: [ self doSomethingOnClick ];
		with: 'Click here to do something'.
		
The following code is a shortcut to create an anchor. The executed action is #doSomethingOnClick and the text is 'Do Something On Click':

	html anchor
		on: #doSomethingOnClick of: self

2. In the following case, a link to an external resource will be generated:

	html anchor
		url: 'http://www.seaside.st';
		with: 'Visit the Seaside'