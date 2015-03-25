# Introduction #

[Gettext](http://www.gnu.org/software/gettext/) is a library for "translating" applications to multiple languages. Seaside-Gettext allows you to use gettext from Seaside applications.


# Getting Started #
In a recent image, DoIt:

  1. (! ConfigurationOfSeaside3 project version: #stable ) load: #('Seaside-Gettext-Core'  'Seaside-Gettext- Examples').

Previously that was:
  1. Load Gettext from http://www.squeaksource.com/PharoNonCorePackages
  1. Load Seaside-Gettext-Core from http://www.squeaksource.com/Seaside30Addons
  1. If you're on Pharo load Seaside-Pharo-Gettext-Core from http://www.squeaksource.com/Seaside30Addons. This is only needed to export the strings to translate.

# API #
The easiest way to translate a string is using the `#translate:` message on the render canvas.
```
html translate: 'text to translate'
```
This will use content negotiation to find the first language that's supported by both your system and the user. If you want the set the user language to a specific one send `#locale:` to the current session. If you want to translate to a specific language use
```
html translate: 'other text to translate' to: aWALocale
```

This doesn't work for attributes. In these cases you want to use `#seasideTranslated` on `String`
```
html image url: aWAUrl; altText: 'sunrise at the beach' seasideTranslated
```
or
```
html image url: aWAUrl; altText: ('sunrise at the beach' seasideTranslatedTo: aWALocale)
```

There are some cases when neither of these approaches work. Mainly when the method that contains the literal is executed outside of a Seaside request. In these cases you can use `#seasideLazyTranslated`
```
descriptionFirstName
	^ MAStringDescription new
		accessor: #firstName;
		label: 'First Name' seasideLazyTranslated;
		priority: 100;
		yourself
```

# Workflow #
  1. write your application using the API above
  1. register your domain. A domain is a way to group strings, you might
  1. have Pier and a reporting application running in the same image and want each to use it's own dictionary: `TextDomainManager registerCategoryPrefix: 'Seaside-Gettext-Examples' domain: 'gettext'`
  1. export the template ` WAGetTextExporter new exportTemplate `
  1. create the translation files e.g. using [poedit](http://www.poedit.net/)
  1. put the translation files in `locale/<locale>/LC_MESSAGES/<domain>.(po|mo)`
  1. done

One of the nice things about gettext is that there are external tools
like [poedit](http://www.poedit.net/) to manage the translation files which you can give to
your translators. No more need to mess around with Excel. There are
also [tools](http://l10n.gnome.org/languages/de/gnome-office/ui/) that display how much of your application is already
translated.

# Application Configuration #
To use Seaside-Gettest in an application a `WALocalizationContextFilter` has to be present. An easy way to do this is override `initializeFilters` in your session class and add it there. See Seaside-Gettext-Examples for an example.