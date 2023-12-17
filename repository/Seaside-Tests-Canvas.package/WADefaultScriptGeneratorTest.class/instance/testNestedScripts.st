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
		gives: '<html><head><title></title></head><body onload="onLoad()"><a id="id2"></a><script type="text/javascript">function onLoad(){$("#id2").closest("div").append("<div id=\"id1\"><\/div><script type=\"text/javascript\">$(\"#id1\").on(\"click\",\".class\",function(){alert(''nested script''});<\/script>");};</script></body></html>'