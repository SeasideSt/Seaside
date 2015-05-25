The IMG element embeds an image in the current document at the location of the element's definition. The IMG element has no content; it is usually replaced inline by the image designated by the src attribute, the exception being for left or right-aligned images that are "floated" out of line.

The alt attribute specifies alternate text that is rendered when the image cannot be displayed (see below for information on how to specify alternate text ). User agents must render alternate text when they cannot support images, they cannot support a certain image type or when they are configured not to display images.

Seaside per default sets the alternate text to an empty string. This helps validation of the page.