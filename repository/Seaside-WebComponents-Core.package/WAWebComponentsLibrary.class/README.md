I am a WebComponent library that allows users to embed Seaside components into existing web pages.


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

Per default no ajaxification will happen so you have to make sure your component does not perform full page requests.

You can opt in to ajaxification using

```language=HTML
<seaside-component url="/examples/headless-counter" ajaxify="true">Loading...</seaside-component>
```