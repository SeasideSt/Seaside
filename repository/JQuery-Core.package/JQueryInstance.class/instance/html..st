manipulating
html: aRenderable 
	"Set the HTML contents of matched elements."
	
	self call: 'html' with: (self createJavascriptStringRenderable: aRenderable)