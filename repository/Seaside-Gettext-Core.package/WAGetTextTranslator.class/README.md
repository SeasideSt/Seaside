I am the WAGetTextTranslator, I manage translations that are imported from `.mo` files.

I am responsible for:
* Managing all available translators (1 translator per set of files with multiple locales)
* Translate for a given locale

My collaborators are:

WAMOFile is a class representing the `.mo` file and needed for the actual translation.

WALocale represents the locale.

WALocalizationContext is a class that uses me a lot in order to translate.

Public API and Key Messages

```
WAGetTextTranslator
		createTranslatorFor: 'seaside-gettext-example'
		fromFiles: (FileLocator imageDirectory / 'some' / 'path' / 'to' / 'mo' / 'files') asFileReference
```
See implementation details about some conventions for the path to `.mo` files.

Internal Representation and Key Implementation Points.

    Instance Variables
	moFiles:		`{'en'->WAMOfile, 'nl-BE'->WAMOFile}` (the locale strings are examples)

Implementation details, conventions about the path for `.mo` files:

A path to `.mo` files expects the following structure:

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

Note: the locale names are examples, "seaside-gettext-example" is also an example name. LC_MESSAGES is not an example that is how it should be called.