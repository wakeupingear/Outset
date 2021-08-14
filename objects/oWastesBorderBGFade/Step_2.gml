/// @description Fade out objects
if room==rWastesBorder alpha=clamp((camX()-100)/600,0,1);
for (var i=0;i<array_length(fadeIn);i++) with fadeIn[i] image_alpha=1-oWastesBorderBGFade.alpha;
for (var i=0;i<array_length(fadeOut);i++) with fadeOut[i] image_alpha=oWastesBorderBGFade.alpha;