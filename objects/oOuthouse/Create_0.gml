event_inherited();

key="notdon_toilet";
check=4;
time=0;
diagFunc=function(){
	time=global.roomTime-hasData("toiletTime");
	conversation(text[0]);
}