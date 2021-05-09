/// @description Garbage collect
if ds_exists(cardQueue,ds_type_queue) ds_queue_destroy(cardQueue);
if ds_exists(cardList,ds_type_list) ds_list_destroy(cardList);