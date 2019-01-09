rendering
updateRoot: anHTMLRoot
    anHTMLRoot title:'seaside.st: Home'.
    anHTMLRoot link beShortcutIcon; url: '/favicon.ico'.
    
    anHTMLRoot stylesheet url: '/styles/main.css'.
    anHTMLRoot stylesheet url: '/styles/shout.css'.
    anHTMLRoot stylesheet url: '/styles/seaside.css'.
    anHTMLRoot stylesheet url: '/styles/print.css'.
    anHTMLRoot script url: '/scripts/prototype.js'; beJavascript.
    anHTMLRoot script url: '/scripts/effects.js'; beJavascript.
    anHTMLRoot script url: '/scripts/controls.js'; beJavascript.
    anHTMLRoot script url: 'http://www.google-analytics.com/urchin.js'; beJavascript.
    anHTMLRoot script beJavascript; with: '_uacct=''UA-2075184-3'';urchinTracker();'.
    anHTMLRoot meta contentScriptType: 'fZCcMGYJZDwS/679EfUS+VeqtrMDrxUQ1f6n3H0nXkE='; name: 'verify-v1'.
    anHTMLRoot meta contentScriptType: 'Pier - Magritte - Seaside'; name: 'generator'.
    anHTMLRoot meta contentScriptType: 'index,follow'; name: 'robots'.
    anHTMLRoot meta contentScriptType: 'seaside.st Home'; name: 'keywords'
