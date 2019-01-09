tests
testSettingRegularPath
 	| cookie |
 	cookie := WACookie new
 		key: 'name';
 		value: 'homer';
 		path: '/springfield/powerplant';
 		yourself.

 	self assert: cookie path equals: '/springfield/powerplant'.
 	self assert: cookie pathUnencoded equals: '/springfield/powerplant'.
 	self assert: cookie pathEncoded equals: '/springfield/powerplant'