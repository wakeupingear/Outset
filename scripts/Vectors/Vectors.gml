function Vec2(_x, _y) constructor
    {
    x = _x;
    y = _y;
    static Add = function( _other )
        {
        x += _other.x;
        y += _other.y;
        }
    }
	
	function Vec3(_x, _y, _z) constructor
    {
    x = _x;
    y = _y;
	z = _z;
    static Add = function( _other )
        {
        x += _other.x;
        y += _other.y;
        z += _other.z;
        }
    }