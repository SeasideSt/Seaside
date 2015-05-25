rendering
renderContentOn: html
	html heading
		title: '&foo;';
		with: '&foo;'.
	html space.
	html anchor
		onClick: '$(&quot;#seastar&quot;).animate({&quot;left&quot;:&quot;-=100px&quot;},{})';
		with: 'Move Left'