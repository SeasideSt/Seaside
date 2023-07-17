private
createHeaders
	| headers |
	headers := OrderedCollection new.
	headers add: 'Project-Id-Version' -> 'Pharo'.
	headers add: 'POT-Creation-Date' -> self currentDateAndTime.
	headers add: 'PO-Revision-Date' -> self currentDateAndTime.
	headers add: 'Last-Translator' -> ''.
	headers add: 'Language-Team' -> ''.
	headers add: 'MIME-Version' -> '1.0'.
	headers add: 'Content-Type' -> ('text/plain; charset=utf-8').
	headers add: 'Content-Transfer-Encoding' -> '8bit'.
	headers add: 'X-Pharo-SystemVersion' -> (SystemVersion current asString).
	^ headers