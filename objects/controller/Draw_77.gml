/// @description Draw application surface
gpu_set_blendenable(false);
var _scX=window_get_width()/384;
var _scY=window_get_height()/216;
if instance_exists(oCamera) //fix camera shake
{
	draw_surface_ext(application_surface,(oCamera.shakeRandX), (oCamera.shakeRandY), _scX,_scY, 0, c_white, 1);
}
else draw_surface_ext(application_surface, 0, 0, _scX,_scY, 0, c_white, 1);
gpu_set_blendenable(true);