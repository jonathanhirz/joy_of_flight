package states;

import luxe.States;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import entity.Plane;
import luxe.utils.Maths;

class GameState extends State {

    var ground : Sprite;
    var plane : Sprite;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {

        ground = new Sprite({
            name : 'ground',
            texture : Luxe.resources.texture('assets/background.png'),
            centered : true,
            depth : -1
        });

        plane = new Plane();

    } //init

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update(dt:Float) {

        Luxe.camera.center.weighted_average_xy(plane.pos.x, plane.pos.y, 5);
        Luxe.camera.center.set_xy(Luxe.camera.center.x, Maths.clamp(Luxe.camera.center.y, -260, 280));

        //todo: loop background side to side. need two copies to swap around?

    } //update

} //GameState
