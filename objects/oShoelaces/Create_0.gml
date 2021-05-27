holes=[
65,72,
85,72,
65,92,
85,92
]
currentHole=0;

mask_index=sShoeHole;

draw=function(){
	var _cx=camX()+192-75;
	var _cy=camY()+108-75;
	var _clicked=(currentHole>array_length(holes))*2;
	for (var i=0;i<array_length(holes);i+=2)
	{
		if currentHole>=i
		{
			if currentHole==i
			{
				if !_clicked&&buttonPressed(control.confirm)&&place_meeting(_cx+holes[i],_cy+holes[i+1],oMouse)
				{
					_clicked=1;
				}
				draw_sprite(sShoeHole,1+image_index,_cx+holes[i],_cy+holes[i+1]);
			}
			else 
			{
				draw_sprite(sShoeHole,0,_cx+holes[i],_cy+holes[i+1]);
				if i>0 pixelLine(_cx+holes[i-2],_cy+holes[i-1],_cx+holes[i],_cy+holes[i+1])
			}
		}
		else draw_sprite(sShoeHole,0,_cx+holes[i],_cy+holes[i+1]);
	}

	if _clicked==1
	{
		currentHole+=2;
		if currentHole>=array_length(holes)
		{
			alarm[0]=30;
		}
	}
}