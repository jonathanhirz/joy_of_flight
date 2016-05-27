package states;
import luxe.States;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import luxe.utils.Maths;

class GameState extends State {

    var ground : Sprite;
    var plane : Sprite;
    var speed : Int = 200;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {

        ground = new Sprite({
            name : 'ground',
            size : new Vector(1000, 64),
            pos : new Vector(0,0),
            color : new Color().rgb(0x3c1910),
            centered : true
        });

        plane = new Sprite({
            name : 'plane',
            size : new Vector(32,32),
            pos : new Vector(0,-64),
        });


    } //init

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update(dt:Float) {

        Luxe.camera.center.weighted_average_xy(plane.pos.x, plane.pos.y, 5);
        Luxe.camera.center.set_xy(Luxe.camera.center.x, Maths.clamp(Luxe.camera.center.y, -500, -300));

        if(Luxe.input.inputdown('up')) {
            plane.pos.y -= speed * dt;
        }
        if(Luxe.input.inputdown('down')) {
            plane.pos.y += speed * dt;
        }
        if(Luxe.input.inputdown('left')) {
            plane.pos.x -= speed * dt;
        }
        if(Luxe.input.inputdown('right')) {
            plane.pos.x += speed * dt;
        }

    } //update

} //GameState
