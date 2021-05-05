/// @description Blur + sprite
image_blend=merge_color(c_white,c_black,darken);

if topLeft==-1
{
	topLeft[0]=lengthdir_x(point_distance(x,y,-1,-1),point_direction(x,y,-1,-1));
	topLeft[1]=lengthdir_y(point_distance(x,y,-1,-1),point_direction(x,y,-1,-1));
	botRight=-1;
	botRight[0]=lengthdir_x(point_distance(x,y,384,216),point_direction(x,y,384,216));
	botRight[1]=lengthdir_y(point_distance(x,y,384,216),point_direction(x,y,384,216));
}

if original drawBlur(surf,max(image_alpha,instance_number(oPopup)-1),192,108,topLeft,botRight,-1);

if animMode==0
{
	xx=x+camX();
	yy=y+camY()+round((1-image_alpha)*24);
}
else if animMode==1
{
	xx=x+camX()+(1-image_alpha)*(192+sprite_get_xoffset(sprite_index));
	yy=y+camY();
}

draw_sprite_ext(sprite_index,image_index,xx,yy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if objs!=-1
{
	if !ds_exists(objList,ds_type_list)
	{
		objList=ds_list_create();
		for (var i=0;i<array_length(objs);i++)
		{
			var _o=instance_create_depth(0,0,depth,asset_get_index(objs[i].obj));
			_o.parentObj=id;
			ds_list_add(objList,_o);
		}
	}
	for (var i=0;i<ds_list_size(objList);i++)
	{
		objList[|i].x=xx-sprite_get_xoffset(sprite_index)+objs[i].xPos;
		objList[|i].y=yy-sprite_get_yoffset(sprite_index)+objs[i].yPos;
		objList[|i].image_alpha=image_alpha;
		objList[|i].image_blend=image_blend;
		with objList[|i] draw();
	}
}