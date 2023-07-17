tests - test data
fileContentsOfPOTFile
	| today now |
	today := Date today yyyymmdd.
	now := String streamContents: [ :str | Time now print24: true showSeconds: false on: str ].
	^'msgid ""
msgstr ""
"Project-Id-Version: Pharo\n"
"POT-Creation-Date: ',today, ' ', now,'-0000\n"
"PO-Revision-Date: ',today, ' ', now,'-0000\n"
"Last-Translator: \n"
"Language-Team: \n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=utf-8\n"
"Content-Transfer-Encoding: 8bit\n"
"X-Pharo-SystemVersion: ',SystemVersion current asString,'\n"


#: WAGettextExample>>renderContentOn:
msgid "fontsize"
msgstr ""

#: WAGettextExample>>renderLocaleSelectionOn:
msgid "Select a locale below"
msgstr ""

#: WAGettextExample>>renderLocaleSelectionOn:
msgid "locale"
msgstr ""

'