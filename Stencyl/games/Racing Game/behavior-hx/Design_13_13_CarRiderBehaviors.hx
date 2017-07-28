package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_13_13_CarRiderBehaviors extends ActorScript
{          	
	
public var _Facing:String;

public var _ThisActorFollowCamera:Bool;

public var _VerticalCamera:Float;

public var _HorizontalCamera:Float;

public var _DoYouWantReloadButton:String;

public var _ReloadButtonKeyIs:String;

public var _LeftControl:String;

public var _UpControl:String;

public var _RightControl:String;

public var _DownControl:String;

public var _Speed:Float;

public var _LeftAnimation:String;

public var _LeftUpAnimation:String;

public var _UpAnimation:String;

public var _UpRightAnimation:String;

public var _RightDownAnimation:String;

public var _RightAnimation:String;

public var _DownLeftAnimation:String;

public var _DownAnimation:String;

public var _TheSoundIs:Sound;

public var _WithSound:Bool;

 
 	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Facing (optional)", "_Facing");
nameMap.set("This Actor Follow Camera?", "_ThisActorFollowCamera");
_ThisActorFollowCamera = true;
nameMap.set("Vertical Camera", "_VerticalCamera");
_VerticalCamera = 0.0;
nameMap.set("Horizontal Camera", "_HorizontalCamera");
_HorizontalCamera = 0.0;
nameMap.set("Do You Want Reload Button?", "_DoYouWantReloadButton");
_DoYouWantReloadButton = "No";
nameMap.set("Reload Button Key Is", "_ReloadButtonKeyIs");
nameMap.set("Left Control", "_LeftControl");
nameMap.set("Up Control", "_UpControl");
nameMap.set("Right Control", "_RightControl");
nameMap.set("Down Control", "_DownControl");
nameMap.set("Speed", "_Speed");
_Speed = 30.0;
nameMap.set("Left Animation", "_LeftAnimation");
nameMap.set("Left Up Animation", "_LeftUpAnimation");
nameMap.set("Up Animation", "_UpAnimation");
nameMap.set("Actor", "actor");
nameMap.set("Up Right Animation", "_UpRightAnimation");
nameMap.set("Right Down Animation", "_RightDownAnimation");
nameMap.set("Right Animation", "_RightAnimation");
nameMap.set("Down Left Animation", "_DownLeftAnimation");
nameMap.set("Down Animation", "_DownAnimation");
nameMap.set("The Sound Is.", "_TheSoundIs");
nameMap.set("With Sound?", "_WithSound");
_WithSound = false;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        actor.makeAlwaysSimulate();
        actor.setAnimation("" + _Facing);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
{
if(wrapper.enabled)
{
        if(_ThisActorFollowCamera)
{
            engine.moveCamera((actor.getXCenter() + _HorizontalCamera), (actor.getYCenter() + _VerticalCamera));
}

        if(_WithSound)
{
            if(((isKeyDown(_LeftControl) || isKeyDown(_UpControl)) || (isKeyDown(_RightControl) || isKeyDown(_DownControl))))
{
                playSound(_TheSoundIs);
}

}

        if(isKeyDown(_LeftControl))
{
            actor.setXVelocity(-(_Speed));
            actor.setAnimation("" + _LeftAnimation);
            actor.setYVelocity(0);
            if(isKeyDown(_DownControl))
{
                actor.setYVelocity(_Speed);
                actor.setAnimation("" + _DownLeftAnimation);
}

            if(isKeyDown(_UpControl))
{
                actor.setYVelocity(-(_Speed));
                actor.setAnimation("" + _LeftUpAnimation);
}

}

        else if(isKeyDown(_UpControl))
{
            actor.setYVelocity(-(_Speed));
            actor.setAnimation("" + _UpAnimation);
            actor.setXVelocity(0);
            if(isKeyDown(_RightControl))
{
                actor.setXVelocity(_Speed);
                actor.setAnimation("" + _UpRightAnimation);
}

            if(isKeyDown(_LeftControl))
{
                actor.setXVelocity(-(_Speed));
                actor.setAnimation("" + _LeftUpAnimation);
}

}

        else if(isKeyDown(_RightControl))
{
            actor.setXVelocity(_Speed);
            actor.setAnimation("" + _RightAnimation);
            actor.setYVelocity(0);
            if(isKeyDown(_UpControl))
{
                actor.setYVelocity(-(_Speed));
                actor.setAnimation("" + _UpRightAnimation);
}

            if(isKeyDown(_DownControl))
{
                actor.setYVelocity(_Speed);
                actor.setAnimation("" + _RightDownAnimation);
}

}

        else if(isKeyDown(_DownControl))
{
            actor.setYVelocity(_Speed);
            actor.setAnimation("" + _DownAnimation);
            actor.setXVelocity(0);
            if(isKeyDown(_RightControl))
{
                actor.setXVelocity(_Speed);
                actor.setAnimation("" + _RightDownAnimation);
}

            if(isKeyDown(_LeftControl))
{
                actor.setXVelocity(-(_Speed));
                actor.setAnimation("" + _DownLeftAnimation);
}

}

        else
{
            actor.setXVelocity(0);
            actor.setYVelocity(0);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener(_ReloadButtonKeyIs, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
{
if(wrapper.enabled && pressed)
{
        if((_DoYouWantReloadButton == "Yes"))
{
            reloadCurrentScene(null, createCrossfadeTransition(1));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}