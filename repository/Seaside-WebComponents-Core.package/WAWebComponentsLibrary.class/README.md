I am a WebComponent library that allows users to embed Seaside components into existing web pages.

Usually I would not be used directly a Seaside application, instead I would be handed off to a different application or web page that wants to embed Seaside components.

# Usage

To use this library 

```language=HTML
<html>
  <head>
    <!-- -->
    <script src="seaside-components.js" defer></script>
  </head>
  <body>
    <!-- -->
    <seaside-component url="/examples/headless-counter">Loading...</seaside-component>
    <!-- -->
  </body>
</html>
```

# Page Refreshes

When an embeded component does a full page refresh a full page refresh of the containing page will result. If this is not wanted then the component needs to use Ajax or opt-in to ajaxification.

# Ajaxification

Per default no ajaxification will happen so you have to make sure your component does not perform full page requests.

You can opt in to ajaxification using

```language=HTML
<seaside-component url="/examples/headless-counter" ajaxify="true">Loading...</seaside-component>
```