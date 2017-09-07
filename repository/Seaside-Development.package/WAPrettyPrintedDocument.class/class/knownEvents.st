configuration
knownEvents
	knownEvents isNil ifTrue: [ 
		knownEvents := #('onabort' 'onauxiliaryclick' 'onblur' 'oncancel' 'onchange' 'onclick' 'onclose' 'oncontextmenu' 'oncopy' 'oncuechange' 'oncut' 'ondblclick' 'ondrag' 'ondragend' 'ondragenter' 'ondragexit' 'ondragleave' 'ondragover' 'ondragstart' 'ondrop' 'onerror' 'onfocus' 'oninput' 'oninvalid' 'onkeydown' 'onkeypress' 'onkeyup' 'onload' 'onmousedown' 'onmouseenter' 'onmouseleave' 'onmousemove' 'onmouseout' 'onmouseover' 'onmouseup' 'onpaste' 'onreset' 'onresize' 'onscroll' 'onsecuritypolicyviolation' 'onselect' 'onsubmit' 'ontoggle' 'onunload' 'onwheel') asSet ].
	^ knownEvents