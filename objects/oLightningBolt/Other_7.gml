/// @description Bolt activate
shake(2,2,20);
if trigger!=-1&&instance_exists(trigger) switch (trigger.object_index)
{
	case oVBarrier:
		trigger.alarm[0]=4;
		break;
	default: break;
}
instance_destroy();