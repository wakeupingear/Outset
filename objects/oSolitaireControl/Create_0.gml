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
	var _nc=instance_create_depth(camX()-32,camY()-40,depth-1-instance_number(oCard),oCard);
	if _suit==suits.clubs||_suit==suits.spades _nc.textCol=c_black;
	_nc.card=_card;
	_nc.suit=_suit;
	_nc.target_x=_x+camX();
	_nc.target_y=_y+camY();
	_nc.inDeck=inDeck;
	
	return _nc;
}

newGame=function(){
	shuffle();
	
	if instance_exists(oCardCell) instance_destroy(oCardCell);
	if instance_exists(oCardFoundation) instance_destroy(oCardFoundation);
	if instance_exists(oCardDraw) instance_destroy(oCardDraw);
	
	for (var i=0;i<7;i++) 
	{
		var _startX=56+i*44;
		var _startY=88;
		var _cell=instance_create_depth(camX()+_startX,camY()+_startY,depth,oCardCell);
		var _lastCard=-1;
		for (var k=0;k<=i;k++) 
		{
			var _c=createCard(_startX,_startY+2+k*8,false);
			if k==i//||true
			{
				_c.image_xscale=1;
			}
			if _lastCard!=-1
			{
				_c.parent=_lastCard;
				_lastCard.child=_c;
			}
			else 
			{
				_c.parent=_cell;
				_cell.child=_c;
			}
			_lastCard=_c;
		}
	}
	
	var _d=instance_create_depth(camX()+56,camY()+40,depth,oCardDraw);
	while instance_number(oCard)<52
	{
		var _c=createCard(56,40,true);
		ds_queue_enqueue(_d.cardQueue,_c);
		ds_list_add(_d.cardList,_c);
	}
	
	for (var i=0;i<4;i++) instance_create_depth(camX()+188+i*44,camY()+40,depth,oCardFoundation);
}

newGame();

draw=function(){
	if instance_exists(oCardFoundation) with oCardFoundation draw();
	if instance_exists(oCardCell) with oCardCell draw();
}