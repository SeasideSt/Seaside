initialization
renderContentOn: html
	self renderTurboScriptOn: html.
	html div id: #foo.
	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ].
	html horizontalRule; horizontalRule.
	"(html tag:'turbo-frame') 
		id: 'id-sum';
		with:["
			html heading
				level: 1;
				with: (counters inject: 0 into:[ :total :c | c counter + total ]).
			html form: [ 
				html submitButton ]" ]"