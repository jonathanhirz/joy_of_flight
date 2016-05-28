package entity;

import luxe.Vector;
import luxe.Color;
import luxe.Sprite;
import luxe.utils.Maths;

class Plane extends Sprite {

    var speed : Int = 300;
    var gravity : Int = 0;
    var drag : Int = 0;
    var velocity : Vector;
    var acceleration : Vector;

    public function new() {
        super({
            name : 'plane',
            pos : new Vector(0, -64),
            size : new Vector(32,32),
            color : new Color().rgb(0xa43db6),
            depth : 0
        });
    } //new

    override function update(dt:Float) {

        //todo: remove these basic controls when component controls are in
        if(Luxe.input.inputdown('up')) {
            pos.y -= speed * dt;
        }
        if(Luxe.input.inputdown('down')) {
            pos.y += speed * dt;
        }
        if(Luxe.input.inputdown('left')) {
            pos.x -= speed * dt;
        }
        if(Luxe.input.inputdown('right')) {
            pos.x += speed * dt;
        }

        // trace(pos.y);

        pos.y = Maths.clamp(pos.y, -525, 520);

    } //update

} //Plane