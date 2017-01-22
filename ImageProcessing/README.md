#ImageProcessing

This program allows for three possible ways of mixing two images (referred to as the 'source' image, and the 'modifier' image) using pixel scanning and analysis.

###GeneralControls

	'/' to cycle through mix modes.
	'space' to save image.
	mouse position to drive mixing parameters.

###Modes

1 The 'modifier' is drawn in the resolution of the 'source' as a sort of overlay on top of 'source'. Given differently sized images, this creates a spiraling pixel-glitch effect due to pixel offset.

mouseX changes the offset of the 'modifier', and mouseY changes how much of the 'modifier' image's pixel color is added to the corresponding 'source' pixel.

2 The 'modifier''s average pixel color is applied as a tint to the 'source'.

mouseX changes the color 'strength' of the 'modifier''s average pixel color.

3 The 'source' begins to be printed pixel by pixel. When a corresponding pixel from the 'modifier' is a sufficiently similar color to the current 'source' pixel, the printing switches to the 'modifier', and then vice-versa.

mouseX changes the similarity threshold required to switch between images, mouseY changes an interval of how many switches are to be ignored before switching between images, and '.' (period) makes it though that the image switch happens only for a single pixel (or set of pixels, considering the interval controlled by mouseY), rather than a continuous drawing of the other image.
