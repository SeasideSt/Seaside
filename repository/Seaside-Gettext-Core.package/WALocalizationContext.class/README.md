I am a WALocalizationContext and can be used as a filter in Seaside to understand what locale the request has and how to relay that information to WAGetTextTranslator.

Specifically I:
* Relay translation messages to WAGetTextTranslator
* Have a strategy to deal with finding the right locale per request

My collaborator is WAGetTextTranslator, which I have as a translator instance variable. `translate:` and `translate:to:` are methods I have that relays information to WAGetTextTranslator. WARenderer is another collaborator as it calls WACurrentLocalizationContext which uses me to use the `translate:` and `translate:to:` methods.

Example messages that I am used in:
```
self addFilter: WALocalizationContextFilter new.
"or"
handleFiltered: aRequestContext 
	WACurrentLocalizationContext
		use: WALocalizationContext new
		during: [ super handleFiltered: aRequestContext ]
```

Indirect messages I am used in:
```
WACurrentLocalizationContext value translate: aString to: aLocale.
WACurrentLocalizationContext value translate: aString.
html translate: key. "Note: html is a WAHTMLCanvas which inherits WARenderer"
html translate: 'locale' to: each.
```

   Instance Variables
	locale:		<WALocale>
	translator:		<WAGetTextTranslator>