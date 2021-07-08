/// @description 
current_fpsReal="0";
alarm[0]=3;
current_mem="0";
memDLL=-1;
if os_type==os_windows&&false
{
	memDLL=external_define("CleanMem.dll","halo_shg_get_mem",dll_cdecl,ty_real,0);
}