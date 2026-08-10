testing
testScripts
	"https://html.spec.whatwg.org/#restrictions-for-contents-of-script-elements
	"
	self
		assert: [ :html |
         html
            script: (html logger log: '<!-- <script></script>');
            paragraph: 'Test Paragraph' ]
		gives: '<script type="text/javascript">console.log("\x3C!-- \x3Cscript>\x3C/script>")</script><p>Test Paragraph</p>'