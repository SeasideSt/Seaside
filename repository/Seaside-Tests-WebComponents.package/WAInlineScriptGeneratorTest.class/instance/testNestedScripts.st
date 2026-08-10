testing
testNestedScripts

	self
		assert: [ :html |
			html anchor script:
				((html jQuery this closest: 'div') append: [ :r |
					 r div script: (html jQuery this
							  on: 'click'
							  selector: '.class'
							  do: (JSStream on: 'alert(''nested script''')) ]) ]
		gives: '<a id="id1"></a><script type="text/javascript">(function(){$("#id1").closest("div").append("<div id=\"id2\"></div>\x3Cscript type=\"text/javascript\">$(\"#id2\").on(\"click\",\".class\",function(){alert(''nested script''});\x3C/script>");})();</script>'