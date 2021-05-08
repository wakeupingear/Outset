enum suits {
	hearts,
	diamonds,
	spades,
	clubs
}

enum cards {
	ace,
	two,
	three,
	four,
	five,
	six,
	seven,
	eight,
	nine,
	ten,
	jack,
	queen,
	king
}
global.cardNames=["A","2","3","4","5","6","7","8","9","10","J","Q","K"];

deckDown=ds_list_create();
deckUp=ds_list_create();

stacks=array_create(7,ds_list_create());
piles=array_create(4,ds_list_create());

order=ds_list_create(); //random card order
shuffle=function(){ //shuffle the order
	for (var i = 0; i <52; i++) order[| i] = i;
	ds_list_shuffle(order);
}
shuffle();

createCard=function(_x,_y,inDeck){ //create a card object
	var _number=order[|instance_number(oCard)];
	var _suit=_number div 13;
	var _card=_number mod 13;
	var _nc=instance_create_depth(camX(),camY(),depth-1-instance_number(oCard),oCard);
	_nc.moving=!inDeck;
	_nc.image_index=_card;
	_nc.suit=_suit;
	_nc.target_x=_x+camX();
	_nc.target_y=_y+camY();
	_nc.inDeck=inDeck;
	
	/*if !inDeck with _nc
	{
		while place_meeting(target_x,target_y+52,oCard)  target_y+=8;
		if target_y!=_y
		{
			var _p=instance_place(target_x,target_y-8,oCard);
			_p.child=id;
			parent=_p;
		}
	}*/
	
	return _nc;
}

newGame=function(){
	shuffle();
	for (var i=0;i<array_length(stacks);i++) 
	{
		for (var k=0;k<=i;k++) 
		{
			var _c=createCard(100+i*40,20+k*16,false);
			if k==i _c.image_xscale=1;
			if k>0
			{
				parent=stacks[i][|k-1];
				parent.child=id;
			}
			ds_list_add(stacks[i],_c);
		}
	}
	
	var _lastCard=-1;
	while instance_number(oCard)<52
	{
		var _c=createCard(20,30,true);
		_lastCard.child=_c;
		_c.parent=_lastCard;
		_lastCard=_c;
	}
}

newGame();

draw=function(){
	//if instance_exists(oCard) with oCard draw();
}