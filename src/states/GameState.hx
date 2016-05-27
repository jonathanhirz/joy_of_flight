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
    var speed : Int = 300;

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

        plane = new Sprite({
            name : 'plane',
            size : new Vector(32,32),
            pos : new Vector(0,-64),
            depth : 0,
            color : new Color().rgb(0xa43db6)
        });
        //todo: add plane component for controls


    } //init

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update(dt:Float) {

        Luxe.camera.center.weighted_average_xy(plane.pos.x, plane.pos.y, 5);
        Luxe.camera.center.set_xy(Luxe.camera.center.x, Maths.clamp(Luxe.camera.center.y, -260, 280));
        //todo: clamp player to top and bottom of screen
        //todo: loop background side to side. need two copies to swap around?

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
