accessing
rootBlock: aOneArgumentBlock
	"Set the block hat is used to render the html <head> element. An instance of WAHtmlRoot will be passed as an argument. You'll probably want to add:
		root base target: '_top' 
	to your block."
	rootBlock := aOneArgumentBlock