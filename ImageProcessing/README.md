#ImageProcessing

This program allows for three possible ways of mixing two images (referred to as the 'source' image, and the 'modifier' image).

	- The 'modifier' is drawn in the resolution of the 'source' as a sort of overlay on top of 'source'. Given differently sized images, this creates a spiraling pixel-glitch effect due to pixel offset.
	- The 'modifier''s average pixel color is applied as a tint to the 'source'.
	- The 'source' begins to be printed pixel by pixel. When a corresponding pixel from the 'modifier' is a sufficiently similar color to the current 'source' pixel, the printing switches to the 'modifier', and then vice-versa.

###Controls

	'/' to cycle through mix modes.
	'space' to save image.
	mouse to drive mixing parameters.