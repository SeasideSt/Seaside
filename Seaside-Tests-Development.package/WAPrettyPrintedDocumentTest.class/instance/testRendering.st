testing
testRendering
	self
		assert: WAPrettyPrintedDocumentTestComponent new
		rendersAs: '&lt;<span class="wa-tag">h1</span>&nbsp;<span class="wa-attribute-key">title</span>=<span class="wa-attribute-value">&quot;&amp;amp;foo;&quot;</span>&gt;&amp;amp;foo;&lt;/<span class="wa-tag">h1</span>&gt;&amp;nbsp;<br/>&lt;<span class="wa-tag">a</span>&nbsp;<span class="wa-attribute-key">onclick</span>=<span class="wa-attribute-value">&quot;<a onclick="$(&amp;quot;#seastar&amp;quot;).animate({&amp;quot;left&amp;quot;:&amp;quot;-=100px&amp;quot;},{})">$(&amp;amp;quot;#seastar&amp;amp;quot;).animate({&amp;amp;quot;left&amp;amp;quot;:&amp;amp;quot;-=100px&amp;amp;quot;},{})</a>&quot;</span>&gt;Move Left&lt;/<span class="wa-tag">a</span>&gt;'