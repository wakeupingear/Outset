/// @description Destroy objects
if ds_exists(order,ds_type_list) ds_list_destroy(order);

if instance_exists(oCardCell) instance_destroy(oCardCell);
if instance_exists(oCardFoundation) instance_destroy(oCardFoundation);
if instance_exists(oCardDraw) instance_destroy(oCardDraw);