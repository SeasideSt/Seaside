updating
updateRoot: aRoot
	super updateRoot: aRoot.
	aRoot javascript url: WAFlameGraphLibrary / #d3v7Js.
	aRoot javascript url: WAFlameGraphLibrary / #d3flamegraphminJs.
	aRoot stylesheet url: WAFlameGraphLibrary / #flamegraphCss