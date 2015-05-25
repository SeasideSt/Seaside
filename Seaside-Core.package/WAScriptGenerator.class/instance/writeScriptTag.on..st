private
writeScriptTag: aBlock on: aDocument
	"Utitlity method to properly wrap the script generation code in aBlock onto aDocument."

	| attributes |
	attributes := WAHtmlAttributes new.
	attributes at: 'type' put: 'text/javascript'.
	aDocument openTag: 'script' attributes: attributes; nextPutAll: '/*<![CDATA[*/'.
	aBlock value.
	aDocument nextPutAll: '/*]]>*/'; closeTag: 'script'