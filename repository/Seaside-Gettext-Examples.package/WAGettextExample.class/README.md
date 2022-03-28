I am an example of a web application that uses the WAGetTextTranslator under the hood, called: WAGettextExample.

I am responsible for: 
- importing the translation files that will be available during the lifetime of the web application. This also creates a WAGetTextTranslator instance that is registered with the WAGetTextTranslator class
- Registering my own instance at WAAdmin as my instance side is responsible for rendering HTML pages and things of that nature
- Exporting translations

My collaborators are: WAGetTextTranslator, WAAdmin, WAGetTextConfiguration, WAGettextExampleSession

Indirect collaborators: WALocalizationContextFilter (due to WAGettextExampleSession)

To initialize me, click on the icon next to `initialize` on my class side.

To adapt me, think about the following:
- In the register method you can type the web application name you want to use.
- in `importTranslations` the path name needs to be stated where the `.mo` files are. It expects the following structure:
```
"
	* nl_BE
		* LC_MESSAGES
			* seaside-gettext-example.mo
	* fr
		* LC_MESSAGES
			* seaside-gettext-example.mo
	* de_CH
		* LC_MESSAGES
			* seaside-gettext-example.mo
	* en
		* LC_MESSAGES
			* seaside-gettext-example.mo
"
```

Note: the locale names are examples, "seaside-gettext-example" is also an example name. LC_MESSAGES is not an example that is how it should be called.