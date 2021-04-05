/// @description Zoom
global.zoomLevel+=global.zoomStep;
camera_set_view_size(global.cam,384*global.zoomLevel,216*global.zoomLevel);
if global.zoomLevel!=global.zoomTo alarm[0]=1;