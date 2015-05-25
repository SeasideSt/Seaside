rendering
renderExampleOn: html
	html paragraph: 'Complex, multi-page workflows can be expressed in Seaside with a single method. Unlike many web frameworks  which require a separate handler for each page or request, Seaside models an entire user session as a continuous piece of code, with natural, linear control flow.'.

	html div class: #seasideExample; with: self taskExample.
		
	html paragraph: [		
		html text: 'This example subclasses '; code: 'WATask'; text: ' and implements the hook method '; code: '#go'.
		html text: '. We store the user''s choice in an instance variable named '; code: 'cheese.' ].

	self renderGoCodeOn: html.
	
	html paragraph: [
		html text: 'To allow the user to choose from a list of famous Swiss cheeses, we use the convenience method '; code: '#chooseFrom:caption:'; text: ' which returns the chosen element from a collection or '; code: 'nil'; text: ' if the user cancels the dialog. If '; code: 'nil'; text: ' is returned, we simply ask again.' ].
	
	self renderChooseCheeseCodeOn: html.
	
	html paragraph: [
		html text: 'Then we ask the user to confirm their choice. The '; code: '#confirm:'; text: ' method answers a '; code: 'boolean:' ].
	
	self renderConfirmCheeseCodeOn: html.
	
	html paragraph: [
		html text: 'Finally we display the user''s choice using '; code: '#inform:.' ].
	
	self renderInformCheeseCodeOn: html.
	
	html paragraph: 'As simple as that. And yes, the browser''s Back button still works.'
		
