/// @description Souldrop check
if instance_exists(oSouldropFormation) with instance_nearest(x,y,oSouldropFormation) event_user(0);
//show_message(instance_number(oSouldropCoin))
if !hasData("reacSt")
{
	if instance_exists(oSouldropCoin) instance_deactivate_object(oSouldropCoin);
}