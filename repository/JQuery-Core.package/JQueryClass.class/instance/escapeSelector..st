utilities
escapeSelector: aString
	"Escapes any character that has a special meaning in a CSS selector."
	
	self call: 'escapeSelector' with: aString