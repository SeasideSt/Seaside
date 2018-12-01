"
No known browser support.

The meter element represents a scalar measurement within a known range, or a fractional value; for example disk usage, the relevance of a query result, or the fraction of a voting population to have selected a particular candidate.

This is also known as a gauge.

The meter element should not be used to indicate progress (as in a progress bar). For that role, HTML provides a separate progress element.

There are six attributes that determine the semantics of the gauge represented by the element.

The min attribute specifies the lower bound of the range, and the max attribute specifies the upper bound. The value attribute specifies the value to have the gauge indicate as the ""measured"" value.

The other three attributes can be used to segment the gauge's range into ""low"", ""medium"", and ""high"" parts, and to indicate which part of the gauge is the ""optimum"" part. The low attribute specifies the range that is considered to be the ""low"" part, and the high attribute specifies the range that is considered to be the ""high"" part. The optimum attribute gives the position that is ""optimum""; if that is higher than the ""high"" value then this indicates that the higher the value, the better; if it's lower than the ""low"" mark then it indicates that lower values are better, and naturally if it is in between then it indicates that neither high nor low values are good.

The value, min, low, high, max, and optimum attributes are all optional. When present, they must have values that are valid floating point numbers.

The following examples all represent a measurement of three quarters (of the maximum of whatever is being measured):

<meter>75%</meter>
<meter>750\u2030</meter>
<meter>3/4</meter>
<meter>6 blocks used (out of 8 total)</meter>
<meter>max: 100; current: 75</meter>
<meter><object data=""graph75.png"">0.75</object></meter>
<meter min=""0"" max=""100"" value=""75""></meter>


"
Class {
	#name : #WAMeterTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAMeterTag >> high: anInteger [
	"The high attribute specifies the range that is considered to be the 'high' part."
	self attributeAt: 'high' put: anInteger
]

{ #category : #attributes }
WAMeterTag >> low: anInteger [
	"The low attribute specifies the range that is considered to be the 'low' part."
	self attributeAt: 'low' put: anInteger
]

{ #category : #attributes }
WAMeterTag >> max: anInteger [
	"The the max attribute specifies the upper bound of the range."
	self attributeAt: 'max' put: anInteger
]

{ #category : #attributes }
WAMeterTag >> min: anInteger [
	"The min attribute specifies the lower bound of the range."
	self attributeAt: 'min' put: anInteger
]

{ #category : #attributes }
WAMeterTag >> optimum: anInteger [
	"The optimum attribute gives the position that is 'optimum'; if that is higher than the 'high' value then this indicates that the higher the value, the better; if it's lower than the 'low' mark then it indicates that lower values are better, and naturally if it is in between then it indicates that neither high nor low values are good."
	self attributeAt: 'optimum' put: anInteger
]

{ #category : #accessing }
WAMeterTag >> tag [
	^ 'meter'
]

{ #category : #attributes }
WAMeterTag >> value: anInteger [
	"The value  attribute specifies the value to have the gauge indicate as the 'measured' value."
	self attributeAt: 'value' put: anInteger
]
