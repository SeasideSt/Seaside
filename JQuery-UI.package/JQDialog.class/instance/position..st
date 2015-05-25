options-generated
position: aStringOrArray
	"Specifies where the dialog should be displayed. Possible values: 
1) a single string representing position within viewport: 'center', 'left', 'right', 'top', 'bottom'. 
2) an array containing an x,y coordinate pair in pixel offset from left, top corner of viewport (e.g. [350,100]) 
3) an array containing x,y position string values (e.g. ['right','top'] for top right corner)."

	self optionAt: 'position' put: aStringOrArray