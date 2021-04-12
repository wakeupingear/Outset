/// @description Destroy data structure
if surface_exists(surf) surface_free(surf);
if ds_exists(ds_type_list,objList) ds_list_destroy(objList);