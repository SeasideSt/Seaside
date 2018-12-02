"
CSS and images used by the web-based development tools.

The icons are from the Tango Desktop Project (tango.freedesktop.org), they are licensed under the Creative Commons Attribution Share-Alike license.

"
Class {
	#name : #WADevelopmentFiles,
	#superclass : #WAFileLibrary,
	#category : 'Seaside-Development-Core'
}

{ #category : #uploaded }
WADevelopmentFiles >> codebrowserPng [
	^ #(137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 16 0 0 0 16 8 6 0 0 0 31 243 255 97 0 0 0 6 98 75 71 68 0 255 0 255 0 255 160 189 167 147 0 0 0 9 112 72 89 115 0 0 11 19 0 0 11 19 1 0 154 156 24 0 0 0 7 116 73 77 69 7 213 9 22 18 55 41 59 82 2 72 0 0 1 203 73 68 65 84 56 203 165 147 77 104 19 65 20 199 127 51 221 163 72 22 34 45 226 177 224 41 160 88 43 1 15 130 21 132 120 236 69 208 182 39 175 165 23 21 60 138 32 197 32 245 34 126 128 154 22 138 49 189 91 26 17 77 92 16 237 193 98 211 141 27 76 253 192 213 108 235 16 21 90 145 205 120 48 67 179 109 106 43 190 203 255 13 204 251 207 111 102 222 131 255 12 97 146 226 93 250 128 25 224 216 86 122 120 136 188 169 147 0 151 71 47 157 1 102 14 30 119 216 142 182 18 88 77 189 1 240 237 249 57 182 163 87 79 74 221 172 59 45 141 211 222 84 64 89 21 88 221 147 167 172 10 252 232 122 216 86 95 76 75 6 199 138 28 233 31 6 24 55 4 196 227 113 196 137 165 63 139 125 77 101 77 125 223 39 127 79 50 116 237 25 31 158 140 51 183 16 132 64 135 213 122 31 165 20 245 122 125 195 75 7 65 128 155 73 173 21 123 203 124 45 77 117 0 61 17 3 219 182 177 109 59 82 236 251 62 110 38 197 224 88 145 197 199 25 94 149 151 81 165 28 64 207 200 100 99 246 175 4 230 228 129 116 129 197 124 134 185 183 10 85 202 241 115 255 69 206 159 189 48 11 136 77 9 180 214 20 210 189 12 92 121 138 55 125 135 202 231 239 168 249 7 188 239 26 166 179 205 55 70 8 180 214 100 179 89 126 201 67 204 59 14 239 62 213 89 122 61 5 189 105 118 173 172 0 218 52 161 110 75 16 134 33 187 63 166 121 244 165 155 251 185 28 221 242 37 59 251 110 145 76 38 113 93 151 55 149 5 140 139 92 79 80 173 86 241 60 143 145 201 6 71 59 43 172 238 72 16 30 24 37 145 72 96 89 22 150 101 69 186 120 3 65 44 22 67 107 77 173 86 67 107 141 148 18 173 53 66 8 132 16 173 219 27 17 3 165 20 142 227 108 58 117 198 100 125 24 131 137 155 183 175 159 250 135 41 158 48 201 111 90 157 232 152 121 9 252 18 0 0 0 0 73 69 78 68 174 66 96 130) asByteArray
]

{ #category : #styles }
WADevelopmentFiles >> developmentCss [
	^ '/* toolbar */
body { margin-bottom: 25px !important; /*matches toolbar min-height + padding and margin*/}
.wa-toolbar {
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 20;
	padding: 2px;
	position: fixed;
	text-align: left;
	background-color: #eee;
	border-top: 1px solid #aaa;
	min-height: 20px;
}
.wa-toolbar { vertical-align: middle; }
.wa-toolbar, .wa-toolbar * {
	color: #444;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
.wa-toolbar a {
	padding-left: 3px;
	padding-right: 3px;
	text-decoration: none;
}
.wa-toolbar a:hover {
	text-decoration: underline;
}
.wa-toolbar .wa-deprecationtoolplugin {
	color: #ff7000;
}

/* halos */
.wa-halo {
	margin: 4px;
	text-align: left;
	border: 1px solid #aaa;
}

.wa-halo .wa-halo-header {
	padding: 2px 4px ;
	overflow: hidden;
	background-color: #eee;
	border-bottom: 1px solid #aaa;
}
.wa-halo .wa-halo-header,
.wa-halo .wa-halo-header * {
	color: #444;
	font-size: 14px;
	font-family: "Helvetica Neue", Helvetica, Verdana, Arial, sans-serif;
}
.wa-halo .wa-halo-header a {
	text-decoration: none;
}
.wa-halo .wa-halo-header .wa-classnamehaloplugin,
.wa-halo .wa-halo-header .wa-browserhaloplugin,
.wa-halo .wa-halo-header .wa-inspectorhaloplugin,
.wa-halo .wa-halo-header .wa-styleshaloplugin {
	float: left;
	display: block;
	padding-right: 4px;
}
.wa-halo .wa-halo-header .wa-classnamehaloplugin {
	font-weight: bold;
	padding-right: 8px;
}
.wa-halo .wa-halo-header .wa-browserhaloplugin, .window .window-titlebar .wa-browserhaloplugin {
	background: url(codebrowser.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-inspectorhaloplugin, .window .window-titlebar .wa-inspectorhaloplugin {
	background: url(inspector.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-styleshaloplugin, .window .window-titlebar .wa-styleshaloplugin {
	background: url(styleeditor.png) no-repeat;
}
.wa-halo .wa-halo-header .wa-browserhaloplugin a,
.wa-halo .wa-halo-header .wa-inspectorhaloplugin a,
.wa-halo .wa-halo-header .wa-styleshaloplugin a {
	width: 16px;
	outline: none;
	display: block;
	text-indent: -32000px;
	background-position: 0 50%;
}
.wa-halo .wa-halo-header .wa-modehaloplugin {
	float: right;
	display: block;
	padding-right: 4px;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a {
	text-decoration: none;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a:hover {
	text-decoration: underline;
}
.wa-halo .wa-halo-header .wa-modehaloplugin a.active {
	font-weight: bold;
}

.wa-halo .wa-halo-body {
	clear: both;
}
.wa-halo .wa-halo-body .wa-halo-source {
	padding: 2px 4px;
	background-color: #fff;
}
.wa-halo .wa-halo-body .wa-halo-source,
.wa-halo .wa-halo-body .wa-halo-source * {
	color: #444;
	line-height: 1;
	font-size: 12px;
	font-family: Monaco, "Courier New", Courier, serif;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-tag {
	color: navy;
	font-weight: bold;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-key {
	color: navy;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value,
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value a {
	color: purple;
	text-decoration: none;
}
.wa-halo .wa-halo-body .wa-halo-source .wa-attribute-value a:hover {
	text-decoration: underline;
}'
]

{ #category : #uploaded }
WADevelopmentFiles >> inspectorPng [
	^ #(137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 16 0 0 0 16 8 6 0 0 0 31 243 255 97 0 0 0 6 98 75 71 68 0 240 0 240 0 239 52 6 103 27 0 0 0 9 112 72 89 115 0 0 11 19 0 0 11 19 1 0 154 156 24 0 0 0 7 116 73 77 69 7 213 11 5 16 15 5 37 253 173 47 0 0 1 246 73 68 65 84 56 203 157 146 77 107 19 81 24 133 159 59 201 36 77 154 102 134 74 82 10 10 181 93 104 26 69 20 193 133 184 20 10 85 119 226 38 191 192 111 169 244 31 136 182 36 65 68 20 116 89 119 85 16 197 77 168 59 65 236 162 84 40 164 137 86 171 150 80 53 141 205 71 39 77 50 51 215 69 72 73 66 82 170 103 119 15 239 61 239 225 188 71 60 121 250 120 49 247 39 119 140 61 64 85 213 231 19 183 38 47 182 144 211 209 187 150 220 35 238 77 223 145 237 162 78 41 235 92 62 191 185 235 118 77 211 59 242 78 33 196 206 35 153 76 118 28 10 133 66 93 133 119 28 180 15 102 50 25 102 95 204 2 144 152 75 0 208 180 107 119 7 223 190 175 146 74 167 57 122 106 140 109 197 139 105 43 184 100 133 212 252 107 38 110 223 140 196 162 247 159 53 254 40 237 14 52 93 35 149 78 115 232 228 24 159 11 94 6 7 2 140 28 8 82 18 62 180 209 113 252 154 62 115 237 198 149 227 93 29 36 230 18 12 135 79 179 82 112 115 233 204 16 190 30 21 211 182 81 29 10 239 150 37 193 35 227 54 75 111 22 0 1 160 116 10 75 122 3 12 13 232 88 182 100 219 52 169 212 44 202 85 139 126 159 155 95 101 181 37 9 69 74 137 148 118 75 48 110 183 11 132 160 92 181 168 214 36 155 91 53 220 170 131 253 253 30 164 16 45 93 112 2 182 105 154 45 78 108 99 131 53 163 138 223 163 162 247 185 176 45 137 223 227 228 211 70 129 125 61 150 157 107 114 174 212 43 234 66 211 116 52 77 231 194 185 243 164 23 222 18 236 19 124 249 153 39 155 43 145 55 42 124 92 89 167 84 174 144 91 122 229 44 21 139 63 26 2 34 26 159 154 177 44 43 210 124 13 195 48 112 56 84 78 156 141 176 188 86 100 203 84 24 236 149 172 47 190 100 248 224 8 0 31 230 223 167 30 62 120 116 88 116 107 216 213 235 151 167 2 129 224 100 51 231 235 245 17 30 13 243 59 155 173 247 101 245 43 130 127 68 44 30 149 13 145 255 18 0 148 88 60 106 1 148 13 131 191 6 140 246 211 127 51 231 46 0 0 0 0 73 69 78 68 174 66 96 130) asByteArray
]

{ #category : #accessing }
WADevelopmentFiles >> selectorsToInclude [
	^ #( developmentCss )
]

{ #category : #uploaded }
WADevelopmentFiles >> styleeditorPng [
	^ #(137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 16 0 0 0 16 8 6 0 0 0 31 243 255 97 0 0 0 6 98 75 71 68 0 255 0 255 0 255 160 189 167 147 0 0 0 9 112 72 89 115 0 0 11 19 0 0 11 19 1 0 154 156 24 0 0 0 7 116 73 77 69 7 214 4 9 20 4 42 36 195 187 166 0 0 2 112 73 68 65 84 56 203 173 147 221 75 83 113 24 199 63 155 155 110 57 245 164 169 232 24 180 240 173 50 207 48 74 144 68 27 82 209 141 43 147 145 136 226 159 97 36 236 70 130 174 162 232 38 34 42 86 104 26 42 5 74 47 243 5 65 212 110 52 148 48 95 74 156 107 206 236 156 249 50 117 110 167 139 58 232 130 186 144 30 248 193 247 226 249 124 248 61 207 143 31 28 172 146 107 156 213 74 119 119 183 114 16 216 180 15 222 19 184 65 116 67 167 27 228 223 167 211 13 226 31 112 226 126 184 198 89 173 104 84 24 232 183 55 54 10 73 201 41 16 217 37 184 178 66 95 107 171 4 84 44 222 110 89 150 229 96 219 204 204 76 89 93 109 61 85 85 85 212 56 171 105 111 123 169 87 5 157 246 250 122 135 226 245 18 24 25 1 69 225 136 77 132 212 52 94 127 15 140 249 46 86 230 100 103 153 15 23 228 159 160 188 188 92 133 117 64 36 14 224 42 60 40 42 41 73 88 236 233 97 119 99 131 104 56 204 178 94 199 156 205 198 194 217 211 230 230 155 46 163 86 27 135 40 138 108 132 130 60 122 248 88 7 68 0 180 234 112 74 40 4 202 222 78 190 230 230 225 63 83 76 83 83 51 62 159 143 188 188 60 218 59 94 176 24 76 222 108 56 89 89 168 246 169 2 79 48 16 32 45 63 31 157 193 192 252 229 75 248 47 216 185 238 172 197 231 243 97 52 26 233 31 232 227 211 236 23 4 177 250 208 146 144 237 138 17 76 31 79 126 254 166 191 87 193 100 226 104 105 41 19 69 133 92 113 92 99 109 109 13 69 81 88 95 15 50 60 58 202 80 192 138 201 168 195 159 146 105 143 17 124 168 73 170 141 27 44 211 188 21 38 232 26 241 144 62 61 133 167 239 61 130 32 32 203 50 119 238 221 229 227 143 12 66 187 113 108 135 35 49 239 170 3 208 155 37 123 162 152 195 192 173 49 182 36 3 130 55 132 102 106 146 150 251 207 8 71 34 172 104 173 44 109 9 164 101 89 9 200 219 100 202 126 79 140 0 32 204 38 74 244 87 150 204 195 196 235 102 241 246 26 176 228 22 99 200 182 112 42 43 129 213 245 29 62 15 116 72 54 105 201 21 35 8 123 5 207 106 116 206 97 201 201 96 97 122 25 128 236 226 45 178 114 94 49 120 99 202 247 77 41 72 4 200 148 253 30 155 180 228 122 50 249 110 92 21 104 0 28 117 86 49 122 46 208 127 190 193 34 24 73 37 202 46 235 138 159 161 167 43 146 118 40 189 162 203 61 63 254 183 143 161 81 131 163 206 42 238 28 219 113 233 205 146 93 189 85 252 92 188 235 95 240 127 169 159 24 23 11 103 188 240 115 88 0 0 0 0 73 69 78 68 174 66 96 130) asByteArray
]
