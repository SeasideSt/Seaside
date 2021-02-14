Class {
	#name : #WACanvasBrushTest,
	#superclass : #WAAbstractCanvasBrushTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #configuration }
WACanvasBrushTest >> createHandlers [
	^ Array with: (WARegistry new
		 cache: WAPredictableCache new;
		yourself)
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testArticle [
	self
		assert: [ :html | html article ]
		gives: '<article></article>'.
	self
		assert: [ :html | html article: 'test' ]
		gives: '<article>test</article>'.
	self
		assert: [ :html | html article with:[ html text: 'test' ] ]
		gives: '<article>test</article>'.
]

{ #category : #tests }
WACanvasBrushTest >> testBasicNesting [
	self assert: [ :html | html div ] gives: '<div></div>'.
	self assert: [ :html | html div: 1 ] gives: '<div>1</div>'.
	self assert: [ :html | html div: 'foo' ] gives: '<div>foo</div>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testBlock [
	self
		assert: [ :html | html strong: [ html text: 'nes'; text: 'sie' ] ]
		gives: '<strong>nessie</strong>'.
	self
		assert: [ :html | html strong: [ :html2 | html2 text: 'nes'; text: 'sie' ] ]
		gives: '<strong>nessie</strong>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testBreakTag [
	self
		assert: [ :html | html break ]
		gives: '<br/>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testButton [
	self
		assert: [ :html | html button ]
		gives: '<button type="submit"></button>'.
	self
		assert: [ :html | html button text: 'foo' ]
		gives: '<button type="submit">foo</button>'.
	self
		assert: [ :html | html button with: 'foo' ]
		gives: '<button type="submit">foo</button>'.
	self
		assert: [ :html | html button beSubmit ]
		gives: '<button type="submit"></button>'.
	self
		assert: [ :html | html button bePush ]
		gives: '<button type="button"></button>'.
	self
		assert: [ :html | html button beReset ]
		gives: '<button type="reset"></button>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testCancelButton [
	self
		assert: [ :html | html cancelButton ]
		gives: '<input type="submit"/>'.
	self
		assert: [ :html | html cancelButton callback: [ ] ]
		gives: '<input name="1" type="submit"/>'.
	self
		assert: [ :html | html cancelButton on: #value of: self ]
		gives: '<input value="Value" name="1" type="submit"/>'.
	self
		assert: [ :html | html cancelButton: 'foo' ]
		gives: '<input value="foo" type="submit"/>'.
	self
		assert: [ :html | html cancelButton text: 'bar' ]
		gives: '<input value="bar" type="submit"/>'.
	self
		assert: [ :html | html cancelButton with: 'zork' ]
		gives: '<input value="zork" type="submit"/>'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasHtml [
	self assert: [ :html | html html: '<' ] gives: '<'.
	self assert: [ :html | html html: '>' ] gives: '>'.
	self assert: [ :html | html html: '"' ] gives: '"'.
	self assert: [ :html | html html: '&' ] gives: '&'.
	self
		assert: [ :html | html html: '<div title="&amp;">' ]
		gives: '<div title="&amp;">'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasNil [
	self assert: [ :html | html text: nil ] gives: ''.
	self assert: [ :html | html render: nil ] gives: ''
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasText [
	self assert: [ :html | html text: '<' ] gives: '&lt;'.
	self assert: [ :html | html text: '>' ] gives: '&gt;'.
	self assert: [ :html | html text: '"' ] gives: '&quot;'.
	self assert: [ :html | html text: '&' ] gives: '&amp;'.
	self
		assert: [ :html | html text: '<div title="&amp;">' ]
		gives: '&lt;div title=&quot;&amp;amp;&quot;&gt;'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasWithLineBreaks [
	self
		assert: [ :html | html withLineBreaks: 'a
b
c' ] gives: 'a<br/>b<br/>c'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasWithLineBreaksAndUrls [
	self
		assert: [ :html | html withLineBreaksAndUrls: '1. This is http://www.seaside.st online.
2. This is http://www.squeak.org online.' ]
		gives: '1. This is <a href="http://www.seaside.st">http://www.seaside.st</a> online.<br/>2. This is <a href="http://www.squeak.org">http://www.squeak.org</a> online.'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasWithLineBreaksGemStoneIssue289 [
	"http://code.google.com/p/glassdb/issues/detail?id=289"

	| testBlock |
	testBlock := [ :breakString |
		| stream |
		stream := WriteStream on: String new.
		stream 
			nextPut: $a;
			nextPutAll: breakString;
			nextPut: $b;
			nextPutAll: breakString;
			nextPut: $c.
		self
			assert: [ :html | html withLineBreaks: stream contents ] gives: 'a<br/>b<br/>c' ].
	testBlock value: (String with: Character cr).
	testBlock value: (String with: Character cr with: Character lf).
	testBlock value: (String with: Character lf)

]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testCanvasWithUrls [
	self
		assert: [ :html | html withUrls: 'This is http://www.seaside.st online.' ]
		gives: 'This is <a href="http://www.seaside.st">http://www.seaside.st</a> online.'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testCheckboxTag [
	self
		assert: [ :html | html checkbox ]
		gives: '<input type="checkbox"/>'.
	self
		assert: [ :html | html checkbox value: true ]
		gives: '<input checked type="checkbox"/>'.
	self
		assert: [ :html | html checkbox value: false; callback: [ :value | ] ]
		gives: '<input name="1" type="checkbox"/><input name="2" type="hidden"/>'.
	self
		assert: [ :html | html checkbox value: true; callback: [ :value | ] ]
		gives: '<input checked name="1" type="checkbox"/><input name="2" type="hidden"/>'
]

{ #category : #tests }
WACanvasBrushTest >> testClosingTimes [
	self assert: [ :html | html div; div ] gives: '<div></div><div></div>'.
	self assert: [ :html | html break; div ] gives: '<br/><div></div>'.
	self assert: [ :html | html div; break ] gives: '<div></div><br/>'.
	self assert: [ :html | html break; break ] gives: '<br/><br/>'.

	self assert: [ :html | html div: [ html div ]; div ] gives: '<div><div></div></div><div></div>'.
	self assert: [ :html | html div: [ html break ]; div ] gives: '<div><br/></div><div></div>'.
	self assert: [ :html | html div: [ html div ]; break ] gives: '<div><div></div></div><br/>'.
	self assert: [ :html | html div: [ html break ]; break ] gives: '<div><br/></div><br/>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testCoreAttributesClass [
	self
		assert: [ :html | html div class: 'foo' ]
		gives: '<div class="foo"></div>'.
	self
		assert: [ :html | html div class: 'foo'; class: 'bar' ]
		gives: '<div class="foo bar"></div>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testCoreAttributesId [
	self
		assert: [ :html | html div id: 'foo' ]
		gives: '<div id="foo"></div>'.
	self
		assert: [ :html | html div id: 'foo'; id: 'bar' ]
		gives: '<div id="bar"></div>'.
	self
		assert: [ :html | self assert: (html div id: 'foo'; id) = 'foo' ]
		gives: '<div id="foo"></div>'.
	self
		assert: [ :html | self assert: (html div id) isNil ]
		gives: '<div></div>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testCoreAttributesStyle [
	self
		assert: [ :html | html div style: 'left: 0' ]
		gives: '<div style="left: 0"></div>'.
	self
		assert: [ :html | html div style: 'left: 0'; style: 'top: 2' ]
		gives: '<div style="left: 0;top: 2"></div>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testCoreAttributesTitle [
	self
		assert: [ :html | html div title: 'Seaside' ]
		gives: '<div title="Seaside"></div>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testEditTag [
	self
		assert: [ :html | html inserted: 'foo' ]
		gives: '<ins>foo</ins>'.
	self
		assert: [ :html | html deleted: 'bar' ]
		gives: '<del>bar</del>'
]

{ #category : #tests }
WACanvasBrushTest >> testEnsureId [
	self
		assert: [ :html | self assert: (html div ensureId = 'id1') ]
		gives: '<div id="id1"></div>'.
	self
		assert: [ :html | self assert: (html div id: 'foo'; ensureId) = 'foo' ]
		gives: '<div id="foo"></div>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testEventAttributes [
	self
		assert: [ :html | html div onBlur: 1; onBlur: 2 ]
		gives: '<div onblur="1;2"></div>'.
	self
		assert: [ :html | html div onChange: 1; onChange: 2 ]
		gives: '<div onchange="1;2"></div>'.
	self
		assert: [ :html | html div onClick: 1; onClick: 2 ]
		gives: '<div onclick="1;2"></div>'.
	self
		assert: [ :html | html div onDoubleClick: 1; onDoubleClick: 2 ]
		gives: '<div ondblclick="1;2"></div>'
]

{ #category : #tests }
WACanvasBrushTest >> testExtendedNesting [
	self assert: [ :html | html div: nil ] gives: '<div></div>'.
	self assert: [ :html | html div: #( 1 $a ) ] gives: '<div>1a</div>'.
	self assert: [ :html | html div: [ html span ] ] gives: '<div><span></span></div>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testFieldSetTag [
	self
		assert: [ :html | html fieldSet: 'foo' ]
		gives: '<fieldset>foo</fieldset>'.
	self
		assert: [ :html | html fieldSet legend: 'bar'; with: 'zork' ]
		gives: '<fieldset><legend>bar</legend>zork</fieldset>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testHeadingTag [
	self
		assert: [ :html | html heading ]
		gives: '<h1></h1>'.
	self
		assert: [ :html | html heading level: 2; with: 'foo' ]
		gives: '<h2>foo</h2>'.
	self
		assert: [ :html | html heading level: 0; with: 'foo' ]
		gives: '<h1>foo</h1>'.
	self
		assert: [ :html | html heading level: 7; with: 'foo' ]
		gives: '<h6>foo</h6>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testHorizontalRuleTag [
	self
		assert: [ :html | html horizontalRule ]
		gives: '<hr/>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testImageButton [
	self
		assert: [ :html | html imageButton ]
		gives: '<input type="image"/>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testImageTag [
	self
		assert: [ :html | html image url: 'http://www.seaside.st/logo.jpeg' ]
		gives: '<img alt="" src="http://www.seaside.st/logo.jpeg"/>'.
		
	self
		assert: [ :html |
			html image
				title: 'Seaside';
				altText: 'the Seaside logo';
				url: 'http://www.seaside.st/logo.jpeg' ]
		gives: '<img alt="the Seaside logo" title="Seaside" src="http://www.seaside.st/logo.jpeg"/>'
]

{ #category : #'tests-attributes' }
WACanvasBrushTest >> testKeyboardAttributes [
	self
		assert: [ :html | html anchor accessKey: $a ]
		gives: '<a accesskey="a"></a>'.
	self
		assert: [ :html | html anchor tabIndex: 3 ]
		gives: '<a tabindex="3"></a>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testLabelTag [
	self
		assert: [ :html | html label: 'foo' ]
		gives: '<label>foo</label>'.
	self
		assert: [ :html | html label for: 'bar'; with: 'zork' ]
		gives: '<label for="bar">zork</label>'
]

{ #category : #tests }
WACanvasBrushTest >> testLastId [
	self
		assert: [ :html | self assert: html lastId isNil ]
		gives: ''.
	self
		assert: [ :html | html nextId. html text: html lastId; text: html lastId ]
		gives: 'id1id1'.
	self
		assert: [ :html | html anchor ensureId; callback: [ ]. self assert: html lastId = 'id1' ]
		gives: '<a id="id1" href="/?2"></a>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testMain [
	self
		assert: [ :html | html main ]
		gives: '<main></main>'.
	self
		assert: [ :html | html main: 'test' ]
		gives: '<main>test</main>'.
	self
		assert: [ :html | html main with:[ html text: 'test' ] ]
		gives: '<main>test</main>'.
]

{ #category : #'tests-tags-anchors' }
WACanvasBrushTest >> testMapTag [
	self
		assert: [ :html | html map callback: [ :point | ]; with: [ html image url: 'seaside.jpg' ] ]
		gives: '<a href="/?1="><img alt="" ismap src="seaside.jpg"/></a>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testMultiSelectTag [
	self
		assert: [ :html | html multiSelect ]
		gives: '<select multiple></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2) ]
		gives: '<select multiple><option>1</option><option>2</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2); labels: [ :v | 2 * v ] ]
		gives: '<select multiple><option>2</option><option>4</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(1 2); enabled: [ :v | v even ] ]
		gives: '<select multiple><option disabled>1</option><option>2</option></select>'.
	self
		assert: [ :html | html multiSelect list: #(3 4); callback: [ :v | ] ]
		gives: '<select name="1" multiple><option value="1">3</option><option value="2">4</option></select><input name="2" type="hidden"/>'
]

{ #category : #tests }
WACanvasBrushTest >> testNextId [
	self
		assert: [ :html | html div id: html nextId ]
		gives: '<div id="id1"></div>'.
	self
		assert: [ :html | html div id: 'foo'; id: html nextId ]
		gives: '<div id="id1"></div>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testOrderedListTag [
	self
		assert: [ :html | html orderedList ]
		gives: '<ol></ol>'.
	self
		assert: [ :html | html orderedList add: 1 ]
		gives: '<ol><li>1</li></ol>'.
	self
		assert: [ :html | html orderedList addAll: #( 1 2 ) ]
		gives: '<ol><li>1</li><li>2</li></ol>'.
	self
		assert: [ :html | html orderedList list: #( 1 2 ) ]
		gives: '<ol><li>1</li><li>2</li></ol>'.
	self
		assert: [ :html | html orderedList list: #( 1 2 ); with: [ html listItem: 3 ] ]
		gives: '<ol><li>1</li><li>2</li><li>3</li></ol>'.
	self
		assert: [ :html | html orderedList add: 2; labels: [ :e | 2 * e ] ]
		gives: '<ol><li>4</li></ol>'.
	self
		assert: [ :html | html orderedList add: 2; labels: [ :e | 2 * e ]; with: [ html listItem: 5 ] ]
		gives: '<ol><li>4</li><li>5</li></ol>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testParagraphTag [
	self
		assert: [ :html | html paragraph ]
		gives: '<p></p>'.
	self
		assert: [ :html | html paragraph: 'foo' ]
		gives: '<p>foo</p>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testPasswordInput [
	self
		assert: [ :html | html passwordInput ]
		gives: '<input type="password"/>'.
	self
		assert: [ :html | html passwordInput callback: [ :value | ] ]
		gives: '<input name="1" type="password"/>'.
	self
		assert: [ :html | html passwordInput: 'foo' ]
		gives: '<input value="foo" type="password"/>'.
	self
		assert: [ :html | html passwordInput value: 'bar' ]
		gives: '<input value="bar" type="password"/>'.
	self
		assert: [ :html | html passwordInput text: 'zork' ]
		gives: '<input value="zork" type="password"/>'.
	self
		assert: [ :html | html passwordInput callback: [ :value | ]; value: 'foo bar&zork' ]
		gives: '<input name="1" value="foo bar&amp;zork" type="password"/>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testScriptTag [
	self
		assert: [ :html | html script: 'alert("<foo>")' ]
		gives: '<script type="text/javascript">alert("<foo>")</script>'.
	self
		assert: [ :html | html script: 'true & false' ]
		gives: '<script type="text/javascript">true & false</script>'.
	self
		assert: [ :html | html script defer; with: 'alert("<foo>")' ]
		gives: '<script defer type="text/javascript">alert("<foo>")</script>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testSelectTag [
	self
		assert: [ :html | html select ]
		gives: '<select></select>'.
	self
		assert: [ :html | html select list: #(1 2) ]
		gives: '<select><option>1</option><option>2</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); labels: [ :v | 2 * v ] ]
		gives: '<select><option>2</option><option>4</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); enabled: [ :v | v even ] ]
		gives: '<select><option disabled>1</option><option>2</option></select>'.
	self
		assert: [ :html | html select list: #(1 2); callback: [ :v | ] ]
		gives: '<select name="1"><option value="1">1</option><option value="2">2</option></select>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testSubmitButton [
	self
		assert: [ :html | html submitButton ]
		gives: '<input type="submit"/>'.
	self
		assert: [ :html | html submitButton callback: [ ] ]
		gives: '<input name="1" type="submit"/>'.
	self
		assert: [ :html | 
			self 
				should: [ html submitButton callback: [ :value | ] ]
				raise: Error ]
		gives: '<input type="submit"/>'.
	self
		assert: [ :html | html submitButton on: #value of: self ]
		gives: '<input value="Value" name="1" type="submit"/>'.
	self
		assert: [ :html | html submitButton: 'foo' ]
		gives: '<input value="foo" type="submit"/>'.
	self
		assert: [ :html | html submitButton text: 'bar' ]
		gives: '<input value="bar" type="submit"/>'.
	self
		assert: [ :html | html submitButton with: 'zork' ]
		gives: '<input value="zork" type="submit"/>'
]

{ #category : #'tests-encoding' }
WACanvasBrushTest >> testSymbolRendering [
	self
		assert: [ :html | html div id: #aSymbol; with: #aSecondSymbol ]
		gives: '<div id="aSymbol">aSecondSymbol</div>'.
	self
		assert: [ :html | html div: [ html text: #aSecondSymbol ] ]
		gives: '<div>aSecondSymbol</div>'.
	self
		assert: [ :html | html div: [ html render: #aSecondSymbol ] ]
		gives: '<div>aSecondSymbol</div>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTable [
	self
		assert: [ :html | html table ]
		gives: '<table></table>'.
	self
		assert: [ :html | html table cellpadding: 0; cellspacing: 1 ]
		gives: '<table cellpadding="0" cellspacing="1"></table>'.
	self
		assert: [ :html | html table frame: 'box'; rules: 'groups' ]
		gives: '<table frame="box" rules="groups"></table>'.
	self
		assert: [ :html | html table summary: 'a short summary' ]
		gives: '<table summary="a short summary"></table>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTableColumn [
	self
		assert: [ :html | html tableColumn ]
		gives: '<col/>'.
	self
		assert: [ :html | html tableColumn character: '.'; characterOffset: 2 ]
		gives: '<col char="." charoff="2"/>'.
	self
		assert: [ :html | html tableColumn align: 'right'; verticalAlign: 'top' ]
		gives: '<col align="right" valign="top"/>'.
	self
		assert: [ :html | html tableColumn span: 3; width: '20' ]
		gives: '<col span="3" width="20"/>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTableColumnGroup [
	self
		assert: [ :html | html tableColumnGroup ]
		gives: '<colgroup></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup character: '.'; characterOffset: 2 ]
		gives: '<colgroup char="." charoff="2"></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup align: 'right'; verticalAlign: 'top' ]
		gives: '<colgroup align="right" valign="top"></colgroup>'.
	self
		assert: [ :html | html tableColumnGroup span: 3; width: '20' ]
		gives: '<colgroup span="3" width="20"></colgroup>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTableData [
	self
		assert: [ :html | html tableData ]
		gives: '<td></td>'.
	self
		assert: [ :html | html tableData character: '.'; characterOffset: 2 ]
		gives: '<td char="." charoff="2"></td>'.
	self
		assert: [ :html | html tableData align: 'right'; verticalAlign: 'top' ]
		gives: '<td align="right" valign="top"></td>'.
	self
		assert: [ :html | html tableData abbreviation: 'short'; with: 'longer' ]
		gives: '<td abbr="short">longer</td>'.
	self
		assert: [ :html | html tableData axis: 'time' ]
		gives: '<td axis="time"></td>'.
	self
		assert: [ :html | html tableData colSpan: 2; rowSpan: 3 ]
		gives: '<td colspan="2" rowspan="3"></td>'.
	self
		assert: [ :html | html tableData headers: 'zork' ]
		gives: '<td headers="zork"></td>'.
	self
		assert: [ :html | html tableData scope: 'colgroup' ]
		gives: '<td scope="colgroup"></td>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTableFull [
	self
		assert: [ :html | 
			html table: [
				html tableCaption: 'title'.
				html tableColumnGroup: [
					html tableColumn.
					html tableColumn ].
				html tableHead: [
					html tableRow: [ 
						html tableHeading: 'a1'.
						html tableHeading: 'a2' ] ].
				html tableFoot: [
					html tableRow: [ 
						html tableData: 'b1'.
						html tableData: 'b2' ] ].
				html tableBody: [
					html tableRow: [ 
						html tableData: 'c1'.
						html tableData: 'c2' ].
					html tableRow: [ 
						html tableData: 'd1'.
						html tableData: 'd2' ] ] ] ]
		gives: '<table><caption>title</caption><colgroup><col/><col/></colgroup><thead><tr><th>a1</th><th>a2</th></tr></thead><tfoot><tr><td>b1</td><td>b2</td></tr></tfoot><tbody><tr><td>c1</td><td>c2</td></tr><tr><td>d1</td><td>d2</td></tr></tbody></table>'
]

{ #category : #'tests-tags-tables' }
WACanvasBrushTest >> testTableHeading [
	self
		assert: [ :html | html tableHeading ]
		gives: '<th></th>'.
	self
		assert: [ :html | html tableHeading character: '.'; characterOffset: 2 ]
		gives: '<th char="." charoff="2"></th>'.
	self
		assert: [ :html | html tableHeading align: 'right'; verticalAlign: 'top' ]
		gives: '<th align="right" valign="top"></th>'.
	self
		assert: [ :html | html tableHeading abbreviation: 'short'; with: 'longer' ]
		gives: '<th abbr="short">longer</th>'.
	self
		assert: [ :html | html tableHeading axis: 'time' ]
		gives: '<th axis="time"></th>'.
	self
		assert: [ :html | html tableHeading colSpan: 2; rowSpan: 3 ]
		gives: '<th colspan="2" rowspan="3"></th>'.
	self
		assert: [ :html | html tableHeading headers: 'zork' ]
		gives: '<th headers="zork"></th>'.
	self
		assert: [ :html | html tableHeading scope: 'colgroup' ]
		gives: '<th scope="colgroup"></th>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testTextArea [
	self
		assert: [ :html | html textArea ]
		gives: '<textarea rows="auto" cols="auto"></textarea>'.
	self
		assert: [ :html | html textArea columns: 4 ]
		gives: '<textarea rows="auto" cols="4"></textarea>'.
	self
		assert: [ :html | html textArea rows: 40 ]
		gives: '<textarea rows="40" cols="auto"></textarea>'.
	self
		assert: [ :html | html textArea callback: [ :value | ] ]
		gives: '<textarea rows="auto" cols="auto" name="1"></textarea>'.
	self
		assert: [ :html | html textArea: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea text: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea value: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea with: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto">foo bar&amp;zork</textarea>'.
	self
		assert: [ :html | html textArea callback: [ :value | ]; with: 'foo bar&zork' ]
		gives: '<textarea rows="auto" cols="auto" name="1">foo bar&amp;zork</textarea>'
]

{ #category : #'tests-tags-forms' }
WACanvasBrushTest >> testTextInput [
	self
		assert: [ :html | html textInput ]
		gives: '<input type="text"/>'.
	self
		assert: [ :html | html textInput callback: [ :value | ] ]
		gives: '<input name="1" type="text"/>'.
	self
		assert: [ :html | html textInput: 'foo' ]
		gives: '<input value="foo" type="text"/>'.
	self
		assert: [ :html | html textInput value: 'bar' ]
		gives: '<input value="bar" type="text"/>'.
	self
		assert: [ :html | html textInput text: 'zork' ]
		gives: '<input value="zork" type="text"/>'.
	self
		assert: [ :html | html textInput callback: [ :value | ]; value: 'foo bar&zork' ]
		gives: '<input name="1" value="foo bar&amp;zork" type="text"/>'
]

{ #category : #'tests-tags' }
WACanvasBrushTest >> testUnorderedListTag [
	self
		assert: [ :html | html unorderedList ]
		gives: '<ul></ul>'.
	self
		assert: [ :html | html unorderedList add: 1 ]
		gives: '<ul><li>1</li></ul>'.
	self
		assert: [ :html | html unorderedList addAll: #( 1 2 ) ]
		gives: '<ul><li>1</li><li>2</li></ul>'.
	self
		assert: [ :html | html unorderedList list: #( 1 2 ) ]
		gives: '<ul><li>1</li><li>2</li></ul>'.
	self
		assert: [ :html | html unorderedList list: #( 1 2 ); with: [ html listItem: 3 ] ]
		gives: '<ul><li>1</li><li>2</li><li>3</li></ul>'.
	self
		assert: [ :html | html unorderedList add: 2; labels: [ :e | 2 * e ] ]
		gives: '<ul><li>4</li></ul>'.
	self
		assert: [ :html | html unorderedList add: 2; labels: [ :e | 2 * e ]; with: [ html listItem: 5 ] ]
		gives: '<ul><li>4</li><li>5</li></ul>'
]
