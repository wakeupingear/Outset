function BresenhamLine(x1,y1,x2,y2,func) {
     
    // Differential
    var dx = x2-x1;
    var dy = y2-y1;
     
    // Increments
    var sx = sign(dx);
    var sy = sign(dy);
     
    // Segment Length
    dx = abs(dx);
    dy = abs(dy);
    var d = max(dx,dy);
     
    var r = d/2;
     
    if (dx > dy) {
        for (var i=0;i<d;i++) {
            func(x1,y1);
            x1 += sx;
            r += dy;
            if (r >= dx) {
                y1 += sy;
                r -= dx;
            }
        }
    }
    else {
        for (var i=0;i<d;i++) {
            func(x1,y1);
            y1 += sy;
            r += dx;
            if (r >= dy) {
                x1 += sx;
                r -= dy;
            }
        }
    }
}

function pixelLine(x1,y1,x2,y2){
	BresenhamLine(x1,y1,x2,y2,function(_x1,_y1) {
        var xx1 = _x1;
        var yy1 = _y1;
        var xx2 = xx1;
        var yy2 = yy1;
        draw_rectangle(xx1,yy1,xx2,yy2,false);
    });
}