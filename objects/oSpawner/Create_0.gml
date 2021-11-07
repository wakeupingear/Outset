xRange=[0,0];
yRange=[0,0];

objs=[];
pos=0;
rate=60;
count=rate*1.5;
alwaysUpdate=false;
conditionFunc=-1;

enum spawnMode{
	randomObj,
	ordered
}
mode=spawnMode.ordered;