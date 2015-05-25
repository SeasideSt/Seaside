accessing
referenceDict
	| dict |
	dict := Dictionary new.
	dict at: #anchor put: 'Anchor Test' -> 1800.
	dict at: #script put: 'Script Test' -> 5300.
	dict at: #table put: 'Table Test' -> 5280.
	dict at: #lineBreak put: 'Line Break Test' -> 4550.
	dict at: #callback put: 'Callback Test' -> 2130.
	dict at: #form put: 'Form Test' -> 270.
	dict at: #id put: 'Generate ID''s Test' -> 4300.
	dict at: #seasideText put: 'Seaside Text Rendering Test' -> 6500.
	dict at: #nativeText put: 'Native Text Rendering Test' -> 26000.
	dict at: #seasideBR put: 'Seaside (br) Rendering Test' -> 23000.
	dict at: #nativeBR put: 'Native (br) Rendering Test' -> 78000.
	^ dict