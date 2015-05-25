styles
defaultCss
	^ 'html { overflow-y: scroll; }
body { margin: 0; padding: 0; background: #434242 url(background.png) repeat-x; font-family: Helvetica,Arial,Verdana,sans-serif; font-size: 80%; line-height: 1.5; color: #222; }
a { text-decoration: none; color: #ff7200; outline: none; cursor: pointer; }
h1, h2, h3, h4, h5, h6 { border: 0; margin: 0; font-weight: normal; letter-spacing: 1px; }

#canvas { position: relative; margin: 0 auto; width: 1000px; }

#header h1.logo { float: left; margin: 50px 0; }
#header h1.logo a { display: block; width: 350px; height: 70px; background-image: url(logo.png); }
#header h1.logo a span { display: none; }

#menu { float: right; margin: 50px 0 10px 0; height: 50px; }
#menu .left, #menu .right { width: 15px; height: 50px; float: left; }
#menu .left { background-image: url(menuLeft.png); }
#menu .right { background-image: url(menuRight.png); }
#menu ul { background-image: url(menu.png); }
#menu ul, #menu ul li { float: left; margin: 0; padding: 0; height: 50px; list-style-type: none; }
#menu ul li a { padding: 0 15px; color: #bbb; line-height: 50px; font-size: 14px; }
#menu ul li a:hover { color: #fff; }

#content { position: relative; margin-bottom: 15px; }
#content { clear: both; background-color: white; }
#content .top, 
#content .bottom { height: 15px; background: url(frame.png); }
#content .head, .body { border: 1px solid #ddd; }
#content .head { height: 70px; border-bottom: none; }
#content .head h2 { float: left; margin: 10px; color: #ff7200; line-height: 50px; font-size: 30px; }
#content .head p { float: left; margin: 10px; padding-left: 20px; line-height: 50px; font-size: 20px; border-left: 1px solid #ddd; }
#content .head { padding: 10px; }

#content .tests { position: relative; padding: 20px; float: left; width: 180px; border-right: 1px solid #ddd; }
#content .tests h3 { font-size: 20px; margin-bottom: 6px; color: #ff7200; }
#content .tests ul, #content .tests ul li { padding: 0; margin: 0; list-style-type: none; }
#content .tests ul { margin-bottom: 20px; }
#content .tests ul li { line-height: 25px; border-bottom: 1px solid #eee; }
#content .tests ul li.active { background-color: #ddd; border-bottom: 1px solid #ccc; }
#content .tests ul li a { padding-left: 10px; color: #222; text-decoration: none; display: block; }
#content .tests ul li a:hover { background:#eee; }

#content .main { position: relative; padding: 20px; float: left; width: 735px; border-left: 1px solid #ddd; margin-left: -1px; }
#content .main h3 { font-size: 20px; margin-bottom: 10px; }
#content .main h4 { font-size: 16px; border-bottom: 1px solid #eee; margin-top: 20px; margin-bottom: 10px; }
#content .main .demo { position: relative; }
#content .main .code { font-family: "Bitstream Vera Sans Mono", Courier, monospace; font-size: 1.2em; line-height: 1.2; width: 735px; white-space: pre-wrap; white-space: -moz-pre-wrap !important; white-space: -pre-wrap; white-space: -o-pre-wrap; word-wrap: break-word; }
#content .main .code .signature { font-weight: bold; }
#content .main .code .wa-tag { font-weight: bold; color: purple; }
#content .main .code .wa-attribute-key { font-weight: bold; color: black; }
#content .main .code .wa-attribute-value { color: blue; }
#content .main .code .wa-attribute-value a { color: blue; text-decoration: underline; }

.actions a { padding-right: 1em; }
#seastar { position: relative; }'