/// @description Garbage collect
if ds_exists(order,ds_type_list) ds_list_destroy(order);
if ds_exists(deckDown,ds_type_list) ds_list_destroy(deckDown);
if ds_exists(deckUp,ds_type_list) ds_list_destroy(deckUp);
for (var i=0;i<array_length(stacks);i++) if ds_exists(stacks[i],ds_type_list) ds_list_destroy(stacks[i]);
for (var i=0;i<array_length(piles);i++) if ds_exists(piles[i],ds_type_list) ds_list_destroy(piles[i]);