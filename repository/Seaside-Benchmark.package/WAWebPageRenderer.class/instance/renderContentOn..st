rendering
renderContentOn: html
    html div id: 'head'; with: [
        html div class: 'columns'; with: [
            html div class: 'search'; with: [
                html numberInput type: 'text'; class: 'text'; name: 4; onKeyPress: 'if((window.event ? window.event.keyCode : event.which) == 13){id3.activate(); return false}; return true'; text: 'Search the Seaside'; style: 'color: #aaa'; onFocus: 'if(value==''Search the Seaside''){value='''';style.color=null}'; id: 'id1'; "unmapped attribute->" attributeAt: 'autocomplete' put: 'off'.
                html div id: 'id8'; style: 'display: none;' ].
            html div class: 'clear' ] ].
    html div class: 'root'; id: 'desk'; with: [
        html div class: 'columns'; with: [
            html div class: 'quadruple'; id: 'home'; with: [
                html image width: 265; height: 142; style: 'vertical-align: top; margin-right: -53px'; altText: 'Seaside - The framework for developing sophisticated web applications in Smalltalk'; resourceUrl: '/styles/logo-plain.png'.
                html image width: 613; height: 180; altText: ''; resourceUrl: '/styles/slogan.07.png' ].
            html div class: 'clear' ].
        html div class: 'columns'; id: 'entry'; with: [
            html div class: 'quadruple'; with: [
                html heading class: 'heading'; level: 1; with: 'Home' ].
            html div class: 'clear' ].
        html div class: 'columns'; id: 'body'; with: [
            html div class: 'single'; with: [
                html heading level: 1; with: [
                    html anchor name: 164699393.
                    html anchor url: 'http://www.seaside.st/about?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&9'; class: 'internal page'; title: 'About'; with: 'About' ].
                html unorderedList:[
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/screenshots?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&10'; class: 'internal page'; title: 'Screenshots'; with: 'Screenshots' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/examples?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&11'; class: 'internal page'; title: 'Examples'; with: 'Examples' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/hosting?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&12'; class: 'internal page'; title: 'Hosting'; with: 'Hosting' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/support?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&13'; class: 'internal page'; title: 'Support'; with: 'Support' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/users?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&14'; class: 'internal page'; title: 'Success Stories'; with: 'Success Stories' ] ].
                html div class: 'more'; with: [
                    html anchor url: 'http://www.seaside.st/about?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&15'; class: 'internal page'; title: 'About'; with: 'more' ].
                html heading level: 1; with: [
                    html anchor name: 199529418.
                    html anchor url: 'http://www.seaside.st/documentation?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&16'; class: 'internal page'; title: 'Documentation'; with: 'Documentation' ].
                html anchor url: 'http://book.seaside.st/book'; class: 'external'; title: 'http://book.seaside.st/book'; style: 'margin-right:0.5em;float:left;'; with: [
                    html image resourceUrl: '/files/3b/lbfipy0c0wupv716l87fdya0uhq9q8/cover.png'; altText: 'Cover.png' ].
                html text:' The open book '.
                html anchor url: 'http://book.seaside.st/book'; class: 'external'; title: 'http://book.seaside.st/book'; with: 'Dynamic Web Development with Seaside'.
                html text:' is available online. '.
                html anchor url: 'http://book.seaside.st/book/introduction/pdf-book/'; class: 'external'; title: 'http://book.seaside.st/book/introduction/pdf-book/'; with: 'Pdf'.
                html text:' and '.
                html anchor url: 'http://book.seaside.st/book/introduction/print-book/'; class: 'external'; title: 'http://book.seaside.st/book/introduction/print-book/'; with: 'paper'.
                html text:' versions are available too.'.
                html div class: 'clear'; with: [
                    html break ].
                html text:'Also see: '.
                html anchor url: 'http://www.seaside.st/documentation/faq?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&17'; class: 'internal page'; title: 'Frequently Asked Questions'; with: 'FAQ'.
                html text:', '.
                html anchor url: 'http://www.seaside.st/documentation/tutorials?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&18'; class: 'internal page'; title: 'Tutorials'; with: 'Tutorials'.
                html text:', '.
                html anchor url: 'http://www.seaside.st/documentation/migration?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&19'; class: 'internal page'; title: 'Migration'; with: 'Migration'.
                html text:', '.
                html anchor url: 'http://www.seaside.st/documentation/videos?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&20'; class: 'internal page'; title: 'Videos'; with: 'Videos'.
                html text:', and '.
                html anchor url: 'http://www.seaside.st/documentation?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&21'; class: 'internal page'; title: 'Documentation'; with: 'more'.
                html text:'.' ].
            html div class: 'single'; with: [
                html heading level: 1; with: [
                    html anchor name: 85066451.
                    html anchor url: 'http://www.seaside.st/community?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&22'; class: 'internal page'; title: 'Community'; with: 'Community' ].
                html unorderedList:[
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/weblogs?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&23'; class: 'internal page'; title: 'Weblogs'; with: 'Weblogs' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/mailinglist?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&24'; class: 'internal page'; title: 'Mailing Lists'; with: 'Mailing Lists' ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/development?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&25'; class: 'internal page'; title: 'Development'; with: 'Development'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/contribute?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&26'; class: 'internal page'; title: 'Contribute'; with: 'Contribute'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about/merchandise?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&27'; class: 'internal page'; title: 'Merchandise'; with: 'Merchandise'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/extensions?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&28'; class: 'internal page'; title: 'Extensions'; with: 'Extensions'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/projects?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&29'; class: 'internal page'; title: 'Projects'; with: 'Projects'
                    ]
                ].
                html div class: 'more'; with: [
                    html anchor url: 'http://www.seaside.st/community?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&30'; class: 'internal page'; title: 'Community'; with: 'more'
                ].
                html break.
                html heading level: 1; with: [
                    html anchor name: 77063584.
                    html anchor url: 'http://www.seaside.st/community/development/seaside30?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&31'; class: 'internal page'; title: 'New in Seaside 3.0'; with: 'Seaside 3.0'
                ].
                html anchor url: 'http://www.seaside.st/?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&32'; title: 'Unit Tests'; class: 'internal'; with: [
                    html image resourceUrl: '/files/5f/3fi9bi61xf9rz941ogtl1vxfoosr6i/000.gif'; altText: 'Unit Tests'
                ]
            ].
            html div class: 'single'; with: [
                html heading level: 1; with: [
                    html anchor name: 182558962.
                    html anchor url: 'http://www.seaside.st/community/weblogs?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&33'; class: 'internal page'; title: 'Weblogs'; with: 'News'
                ].
                html unorderedList class: 'hfeed'; with: [
                    html listItem:[
                        html anchor url: 'http://schrievkrom.wordpress.com/2010/11/02/vasmalltalk-smalltalk-experience/'; class: 'entry-title'; with: 'VASmalltalk  Smalltalk Experience | Schrievkrom'.
                        html abbreviated title: '2010-11-02T20:36:27+00:00'; class: 'published'; with: '2010-11-02T20:36:27+00:00'.
                        html div class: 'entry-summary'; with: 'While in the stage of producing these reduced images I recognized, that there is no real good docume...'
                    ].
                    html listItem:[
                        html anchor url: 'http://astares.blogspot.com/2010/11/ob-web-javascriptajaxsmalltalk-server.html'; class: 'entry-title'; with: 'The Hitchhiker''s Guide to ...: OB-Web - JavaScript/AJAX/Smalltalk ...'.
                        html abbreviated title: '2010-11-02T18:04:00+00:00'; class: 'published'; with: '2010-11-02T18:04:00+00:00'.
                        html div class: 'entry-summary'; with: 'Compared to the standard web based browser tool that comes with the Seaside web framework the one fr...'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.fastcashdesign.com/2010/11/seaside-tutorial-part-1/'; class: 'entry-title'; with: 'Seaside Tutorial Part 1  Web Development Videos  Videos  Fast ...'.
                        html abbreviated title: '2010-11-02T00:11:50+00:00'; class: 'published'; with: '2010-11-02T00:11:50+00:00'.
                        html div class: 'entry-summary'; with: 'Part 1 of the Cincom Smalltalk Seaside Tutorial Rating: 0 | Views: 1373. Share/Save. Sorry, the comm...'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.jarober.com/blog/blogView?showComments=true&printTitle=Seaside_in_Toronto&entry=3466098392'; class: 'entry-title'; with: 'Seaside in Toronto'.
                        html abbreviated title: '2010-11-01T21:06:32+00:00'; class: 'published'; with: '2010-11-01T21:06:32+00:00'.
                        html div class: 'entry-summary'; with: 'The Toronto Smalltalkers are having a Seaside evening: The next meeting of the Toronto Smalltalk Use...'
                    ].
                    html listItem:[
                        html anchor url: 'http://wdtoolkit.com/2010/11/01/why-i-have-migrated-from-ruby-on-rails-to-seaside-2/'; class: 'entry-title'; with: 'Why I have migrated from Ruby on Rails to Seaside'.
                        html abbreviated title: '2010-11-01T15:42:24+00:00'; class: 'published'; with: '2010-11-01T15:42:24+00:00'.
                        html div class: 'entry-summary'; with: 'Ruby on Rails user tells why he switched to Smalltalk & Seaside. Read the full article at the source...'
                    ]
                ].
                html div class: 'more'; with: [
                    html anchor url: 'http://www.seaside.st/community/weblogs?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&34'; class: 'internal page'; title: 'Weblogs'; with: 'more'
                ]
            ].
            html div class: 'single'; id: 'download'; with: [
                html heading level: 1; with: [
                    html anchor name: 192286684.
                    html anchor url: 'http://www.seaside.st/download?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&35'; class: 'internal page'; title: 'Download'; with: 'Download'
                ].
                html paragraph:[
                    html anchor class: 'opensource'; url: 'http://www.opensource.org/licenses/mit-license.php'; with: 'www.opensource.org'.
                    html text:'Seaside is a free and '.
                    html anchor url: 'http://www.opensource.org/licenses/mit-license.php'; class: 'external'; title: 'http://www.opensource.org/licenses/mit-license.php'; with: 'Open Source'.
                    html text:' web application framework distributed under the '.
                    html anchor url: 'http://www.seaside.st/about/license?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&36'; class: 'internal page'; title: 'MIT License'; with: 'MIT License'.
                    html text:'.'
                ].
                html paragraph:'Seaside is available on the following Smalltalk platforms:'.
                html unorderedList:[
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/pharo?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&37'; class: 'internal page'; title: 'Pharo Smalltalk'; with: 'Pharo Smalltalk'.
                        html text:' ('.
                        html anchor url: 'http://www.seaside.st/distributions/Seaside-3.0-final.app.zip'; class: 'external'; title: 'http://www.seaside.st/distributions/Seaside-3.0-final.app.zip'; with: 'download'.
                        html text:')'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/vw?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&38'; class: 'internal page'; title: 'Cincom Smalltalk'; with: 'Cincom Smalltalk'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/dolphin?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&39'; class: 'internal page'; title: 'Dolphin Smalltalk'; with: 'Dolphin Smalltalk'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/gemstone?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&40'; class: 'internal page'; title: 'GemStone Smalltalk'; with: 'GemStone Smalltalk'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/gst?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&41'; class: 'internal page'; title: 'GNU Smalltalk'; with: 'GNU Smalltalk'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/squeak?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&42'; class: 'internal page'; title: 'Squeak Smalltalk'; with: 'Squeak Smalltalk'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download/vast?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&43'; class: 'internal page'; title: 'VA Smalltalk'; with: 'VA Smalltalk'
                    ]
                ].
                html div class: 'more'; with: [
                    html anchor url: 'http://www.seaside.st/download?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&44'; class: 'internal page'; title: 'Download'; with: 'more'
                ].
                html break.
                html paragraph:[
                    html anchor url: 'http://www.esug.org'; with: [
                        html image width: 160; height: 66; altText: 'Approved by ESUG'; resourceUrl: 'http://www.seaside.st/styles/esug.gif'
                    ]
                ]
            ].
            html div class: 'clear'.
        ].
    ].
    html div id: 'foot'; with: [
        html div class: 'columns'; with: [
            html div class: 'single'; id: 'navigation'; with: [
                html heading level: 1; with: [
                    html anchor name: 111710222.
                    html text:'Navigation'
                ].
                html unorderedList:[
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/about?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&45'; class: 'page'; title: 'About'; with: 'About'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/download?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&46'; class: 'page'; title: 'Download'; with: 'Download'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&47'; class: 'page'; title: 'Community'; with: 'Community'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/documentation?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&48'; class: 'page'; title: 'Documentation'; with: 'Documentation'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/seaside30?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&49'; class: 'page'; title: 'Seaside 3.0 Release Announcement'; with: 'Seaside 3.0 Release Announcement'
                    ]
                ]
            ].
            html div class: 'single'; id: 'participate'; with: [
                html heading level: 1; with: [
                    html anchor name: 10281304.
                    html text:'Participate'
                ].
                html unorderedList:[
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/mailinglist?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&50'; class: 'internal page'; title: 'Mailing Lists'; with: 'Mailing Lists'.
                        html text:': Ask questions and talk with Seaside experts.'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/weblogs?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&51'; class: 'internal page'; title: 'Weblogs'; with: 'Weblogs'.
                        html text:': Read the latest news about the Seaside community.'
                    ].
                    html listItem:[
                        html anchor url: 'http://www.seaside.st/community/contribute?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&52'; class: 'internal page'; title: 'Contribute'; with: 'Contribute'.
                        html text:': Help to improve code and documentation of Seaside.'
                    ]
                ]
            ].
            html div class: 'single'; id: 'activity'; with: [
                html heading level: 1; with: [
                    html anchor name: 102496547.
                    html text:'Activity'
                ].
                html unorderedList class: 'hfeed'; with: [
                    html listItem:[
                        html anchor url: 'http://code.google.com/p/seaside/issues/detail?id=607#c1'; class: 'entry-title'; with: 'Update 1 to issue 607 ("No adapter can be stared if two stopped adapters are on the same port")'.
                        html abbreviated title: '2010-11-01T08:43:11+00:00'; class: 'published'; with: '2010-11-01T08:43:11+00:00'.
                        html div class: 'entry-summary'; with: 'This must be a regression... I certainly tested that behaviour when I wrote it.
 
 '
                    ].
                    html listItem:[
                        html anchor url: 'http://code.google.com/p/seaside/issues/detail?id=607'; class: 'entry-title'; with: 'Issue 607 created: "No adapter can be stared if two stopped adapters are on the same port"'.
                        html abbreviated title: '2010-11-01T07:58:35+00:00'; class: 'published'; with: '2010-11-01T07:58:35+00:00'.
                        html div class: 'entry-summary'; with: 'What steps will reproduce the problem?
1. Create an adapter on port 8080
2. Create a second adapter on port 8080
3. Start the first adatper

What is the expected output?
The first adapter can be ...'
                    ]
                ]
            ].
            html div class: 'single'; id: 'powered'; with: [
                html text:'This website is run on '.
                html anchor url: 'http://www.squeak.org'; class: 'external'; title: 'http://www.squeak.org'; with: 'Squeak'.
                html text:', '.
                html anchor url: 'http://www.seaside.st/?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&_n&53'; class: 'internal page'; title: 'Home'; with: 'Seaside'.
                html text:' and is powered by the '.
                html anchor url: 'http://www.lukas-renggli.ch/smalltalk/pier'; class: 'external'; title: 'http://www.lukas-renggli.ch/smalltalk/pier'; with: 'Pier'.
                html text:' CMS. The design was kindly provided by Samuel Morello. The site is hosted on a server of '.
                html anchor url: 'http://www.netstyle.ch'; class: 'external'; title: 'http://www.netstyle.ch'; with: 'netstyle.ch'.
                html text:'.'
            ].
            html div class: 'clear'.
        ].
    ].
    html div id: 'login'; with: [
        html unorderedList:[
            html listItem:[
                html anchor url: 'http://www.seaside.st/?_s=NLql1IePoRspC9yy&_k=ApjT6OTa&command=PULogin&_n&54'; class: 'page'; title: 'Login (l)'; accessKey: 'l'; with: 'Login'
            ]
        ]
    ].
    html script "unmapped attribute->" attributeAt: 'type' put: 'text/javascript'; with: 'function onLoad(){id3=new Ajax.Autocompleter(''id1'',''id8'',''http://www.seaside.st/'',{''evalScripts'':true,''parameters'':[''_s=NLql1IePoRspC9yy'',''_k=ApjT6OTa'',''5''].join(''&''),''afterUpdateElement'':function(){new Ajax.Request(''http://www.seaside.st/'',{''parameters'':[''_s=NLql1IePoRspC9yy'',''_k=ApjT6OTa'',''6'',''7=''+arguments[1].id.match(/^_p([0-9]+)$/)[1]].join(''&'')})}})}'
