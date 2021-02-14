"
Adapted from Zinc

Generate the dynamic DW-Bench HTML page.
Although the date/time is variable, the page size is constant.
"
Class {
	#name : #WADwBenchHandler,
	#superclass : #WARequestHandler,
	#instVars : [
		'pageContent'
	],
	#category : 'Seaside-Benchmark'
}

{ #category : #'class initialization' }
WADwBenchHandler class >> register [
	WADispatcher default
		register: self new at: 'dw-bench'
]

{ #category : #private }
WADwBenchHandler >> generateDWBenchOn: html [
	html heading: 'DW-Bench Dynamic'. 
	html table
		attributeAt: 'border' put: 1;
		with: [
			1 to: 25 do: [ :row |
				html tableRow: [
					1 to: 25 do: [ :col |
						html tableData: row * col ] ] ] ].
	html paragraph: [
		html text: Date today yyyymmdd.
		html text: ''.
		html text: Time now print24 ]
]

{ #category : #handling }
WADwBenchHandler >> handleFiltered: aRequestContext [
	aRequestContext respond: [ :response |
		| document renderContext htmlRoot |
		response contentType: WAMimeType textHtml.
		document := aRequestContext newDocument.
		renderContext := WARenderContext new.
		"Hook objects together"
		renderContext document: document.
		htmlRoot := WAHtmlRoot context: renderContext.
		
		"Render"
		document open: htmlRoot.
		self generateDWBenchOn: (WAHtmlCanvas context: renderContext) ]
]

{ #category : #private }
WADwBenchHandler >> pageContent [
	"taken from seaside.st"
	pageContent isNil ifTrue: [
		pageContent := '<html>
<head>
 <title>DW-Bench Static</title>
</head>
<body>
<h1>DW-Bench Static</h1>
<table border="1">
<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td><td>25</td></tr><tr><td>2</td><td>4</td><td>6</td><td>8</td><td>10</td><td>12</td><td>14</td><td>16</td><td>18</td><td>20</td><td>22</td><td>24</td><td>26</td><td>28</td><td>30</td><td>32</td><td>34</td><td>36</td><td>38</td><td>40</td><td>42</td><td>44</td><td>46</td><td>48</td><td>50</td></tr><tr><td>3</td><td>6</td><td>9</td><td>12</td><td>15</td><td>18</td><td>21</td><td>24</td><td>27</td><td>30</td><td>33</td><td>36</td><td>39</td><td>42</td><td>45</td><td>48</td><td>51</td><td>54</td><td>57</td><td>60</td><td>63</td><td>66</td><td>69</td><td>72</td><td>75</td></tr><tr><td>4</td><td>8</td><td>12</td><td>16</td><td>20</td><td>24</td><td>28</td><td>32</td><td>36</td><td>40</td><td>44</td><td>48</td><td>52</td><td>56</td><td>60</td><td>64</td><td>68</td><td>72</td><td>76</td><td>80</td><td>84</td><td>88</td><td>92</td><td>96</td><td>100</td></tr><tr><td>5</td><td>10</td><td>15</td><td>20</td><td>25</td><td>30</td><td>35</td><td>40</td><td>45</td><td>50</td><td>55</td><td>60</td><td>65</td><td>70</td><td>75</td><td>80</td><td>85</td><td>90</td><td>95</td><td>100</td><td>105</td><td>110</td><td>115</td><td>120</td><td>125</td></tr><tr><td>6</td><td>12</td><td>18</td><td>24</td><td>30</td><td>36</td><td>42</td><td>48</td><td>54</td><td>60</td><td>66</td><td>72</td><td>78</td><td>84</td><td>90</td><td>96</td><td>102</td><td>108</td><td>114</td><td>120</td><td>126</td><td>132</td><td>138</td><td>144</td><td>150</td></tr><tr><td>7</td><td>14</td><td>21</td><td>28</td><td>35</td><td>42</td><td>49</td><td>56</td><td>63</td><td>70</td><td>77</td><td>84</td><td>91</td><td>98</td><td>105</td><td>112</td><td>119</td><td>126</td><td>133</td><td>140</td><td>147</td><td>154</td><td>161</td><td>168</td><td>175</td></tr><tr><td>8</td><td>16</td><td>24</td><td>32</td><td>40</td><td>48</td><td>56</td><td>64</td><td>72</td><td>80</td><td>88</td><td>96</td><td>104</td><td>112</td><td>120</td><td>128</td><td>136</td><td>144</td><td>152</td><td>160</td><td>168</td><td>176</td><td>184</td><td>192</td><td>200</td></tr><tr><td>9</td><td>18</td><td>27</td><td>36</td><td>45</td><td>54</td><td>63</td><td>72</td><td>81</td><td>90</td><td>99</td><td>108</td><td>117</td><td>126</td><td>135</td><td>144</td><td>153</td><td>162</td><td>171</td><td>180</td><td>189</td><td>198</td><td>207</td><td>216</td><td>225</td></tr><tr><td>10</td><td>20</td><td>30</td><td>40</td><td>50</td><td>60</td><td>70</td><td>80</td><td>90</td><td>100</td><td>110</td><td>120</td><td>130</td><td>140</td><td>150</td><td>160</td><td>170</td><td>180</td><td>190</td><td>200</td><td>210</td><td>220</td><td>230</td><td>240</td><td>250</td></tr><tr><td>11</td><td>22</td><td>33</td><td>44</td><td>55</td><td>66</td><td>77</td><td>88</td><td>99</td><td>110</td><td>121</td><td>132</td><td>143</td><td>154</td><td>165</td><td>176</td><td>187</td><td>198</td><td>209</td><td>220</td><td>231</td><td>242</td><td>253</td><td>264</td><td>275</td></tr><tr><td>12</td><td>24</td><td>36</td><td>48</td><td>60</td><td>72</td><td>84</td><td>96</td><td>108</td><td>120</td><td>132</td><td>144</td><td>156</td><td>168</td><td>180</td><td>192</td><td>204</td><td>216</td><td>228</td><td>240</td><td>252</td><td>264</td><td>276</td><td>288</td><td>300</td></tr><tr><td>13</td><td>26</td><td>39</td><td>52</td><td>65</td><td>78</td><td>91</td><td>104</td><td>117</td><td>130</td><td>143</td><td>156</td><td>169</td><td>182</td><td>195</td><td>208</td><td>221</td><td>234</td><td>247</td><td>260</td><td>273</td><td>286</td><td>299</td><td>312</td><td>325</td></tr><tr><td>14</td><td>28</td><td>42</td><td>56</td><td>70</td><td>84</td><td>98</td><td>112</td><td>126</td><td>140</td><td>154</td><td>168</td><td>182</td><td>196</td><td>210</td><td>224</td><td>238</td><td>252</td><td>266</td><td>280</td><td>294</td><td>308</td><td>322</td><td>336</td><td>350</td></tr><tr><td>15</td><td>30</td><td>45</td><td>60</td><td>75</td><td>90</td><td>105</td><td>120</td><td>135</td><td>150</td><td>165</td><td>180</td><td>195</td><td>210</td><td>225</td><td>240</td><td>255</td><td>270</td><td>285</td><td>300</td><td>315</td><td>330</td><td>345</td><td>360</td><td>375</td></tr><tr><td>16</td><td>32</td><td>48</td><td>64</td><td>80</td><td>96</td><td>112</td><td>128</td><td>144</td><td>160</td><td>176</td><td>192</td><td>208</td><td>224</td><td>240</td><td>256</td><td>272</td><td>288</td><td>304</td><td>320</td><td>336</td><td>352</td><td>368</td><td>384</td><td>400</td></tr><tr><td>17</td><td>34</td><td>51</td><td>68</td><td>85</td><td>102</td><td>119</td><td>136</td><td>153</td><td>170</td><td>187</td><td>204</td><td>221</td><td>238</td><td>255</td><td>272</td><td>289</td><td>306</td><td>323</td><td>340</td><td>357</td><td>374</td><td>391</td><td>408</td><td>425</td></tr><tr><td>18</td><td>36</td><td>54</td><td>72</td><td>90</td><td>108</td><td>126</td><td>144</td><td>162</td><td>180</td><td>198</td><td>216</td><td>234</td><td>252</td><td>270</td><td>288</td><td>306</td><td>324</td><td>342</td><td>360</td><td>378</td><td>396</td><td>414</td><td>432</td><td>450</td></tr><tr><td>19</td><td>38</td><td>57</td><td>76</td><td>95</td><td>114</td><td>133</td><td>152</td><td>171</td><td>190</td><td>209</td><td>228</td><td>247</td><td>266</td><td>285</td><td>304</td><td>323</td><td>342</td><td>361</td><td>380</td><td>399</td><td>418</td><td>437</td><td>456</td><td>475</td></tr><tr><td>20</td><td>40</td><td>60</td><td>80</td><td>100</td><td>120</td><td>140</td><td>160</td><td>180</td><td>200</td><td>220</td><td>240</td><td>260</td><td>280</td><td>300</td><td>320</td><td>340</td><td>360</td><td>380</td><td>400</td><td>420</td><td>440</td><td>460</td><td>480</td><td>500</td></tr><tr><td>21</td><td>42</td><td>63</td><td>84</td><td>105</td><td>126</td><td>147</td><td>168</td><td>189</td><td>210</td><td>231</td><td>252</td><td>273</td><td>294</td><td>315</td><td>336</td><td>357</td><td>378</td><td>399</td><td>420</td><td>441</td><td>462</td><td>483</td><td>504</td><td>525</td></tr><tr><td>22</td><td>44</td><td>66</td><td>88</td><td>110</td><td>132</td><td>154</td><td>176</td><td>198</td><td>220</td><td>242</td><td>264</td><td>286</td><td>308</td><td>330</td><td>352</td><td>374</td><td>396</td><td>418</td><td>440</td><td>462</td><td>484</td><td>506</td><td>528</td><td>550</td></tr><tr><td>23</td><td>46</td><td>69</td><td>92</td><td>115</td><td>138</td><td>161</td><td>184</td><td>207</td><td>230</td><td>253</td><td>276</td><td>299</td><td>322</td><td>345</td><td>368</td><td>391</td><td>414</td><td>437</td><td>460</td><td>483</td><td>506</td><td>529</td><td>552</td><td>575</td></tr><tr><td>24</td><td>48</td><td>72</td><td>96</td><td>120</td><td>144</td><td>168</td><td>192</td><td>216</td><td>240</td><td>264</td><td>288</td><td>312</td><td>336</td><td>360</td><td>384</td><td>408</td><td>432</td><td>456</td><td>480</td><td>504</td><td>528</td><td>552</td><td>576</td><td>600</td></tr><tr><td>25</td><td>50</td><td>75</td><td>100</td><td>125</td><td>150</td><td>175</td><td>200</td><td>225</td><td>250</td><td>275</td><td>300</td><td>325</td><td>350</td><td>375</td><td>400</td><td>425</td><td>450</td><td>475</td><td>500</td><td>525</td><td>550</td><td>575</td><td>600</td><td>625</td></tr>

</table>
<p>This is the static DW-Bench page</p>
</body>    
</html>' asByteArray ].
	^ pageContent
]
