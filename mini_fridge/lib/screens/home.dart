import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Home extends StatefulWidget {
  @override
  Splash createState() => new Splash();
  
}

class _HomeState extends State<Home> {


// Variables d'infos du frigo

  double _Temp_in = 17.5;
  double _Temp_out = 20.5;
  double _consigne = 16.5;
  double _hum = 55.5;

// Les fonctions onPressed 
  void _add () => setState (()=> _consigne = _consigne + 0.5);
  void _remove() => setState(() => _consigne = _consigne - 0.5);



  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[700] ,
        actions: <Widget>[
          new Container(
            padding: EdgeInsets.only(right: 80),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text("  Pimp My Fridge  G2  ",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                new Icon(Icons.ac_unit,color: Colors.white,)
              ],
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new Container(
          color: Colors.blueAccent,
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 30.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new IconButton(onPressed: () => Navigator.pop(context), icon: new Icon(Icons.arrow_back),iconSize: 25,),
                  ],
                ),
              ),
              new Container(
                width: 305,
                child:  new FittedBox(
                  child: new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Second');}, child: new Text("Graph des températures"),color: Colors.lightBlue, ),
                  
                ),    
              ),
            ]
          ),
        ),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/background.gif"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(32.0),
        child: new Center(
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Column(
                    
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("Consigne :            $_consigne C°",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                        ]
                      ),
                        SizedBox(height: 20.0,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("Température IN :     $_Temp_in C°",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:   Colors.white)),                          
                        ]
                      ),
                        SizedBox(height: 20.0,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text("Température OUT :    $_Temp_out C°",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                        ]
                      ),
                        SizedBox(height: 20.0,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[ 
                          new Text("Humidité :           $_hum %",style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:  Colors.white)),
                        ]
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 100,top: 200),
                  child: new Row(
                    children: <Widget>[
                      new Text('Etat :',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:  Colors.white)),
                      new Icon(Icons.turned_in,size: 50.0,color: Colors.green),
                      new Text('ON',style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:  Colors.white)),
                    ],
                  ),
                ),
                new Container(
                  
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children : <Widget> [
                      new RaisedButton(child: new Icon(Icons.add, color: Colors.white,), onPressed: _add, color: Colors.red[700] ,),
                      new RaisedButton(child: new Icon(Icons.remove, color: Colors.white,), onPressed: _remove, color: Colors.blueAccent,),
                    ]
                  ),
                ),
                SizedBox(height: 20.0,),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(" © By Rafik Belkadi 2018, Cesi Exia")
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
class Splash extends State<Home> {

   @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new _HomeState(),
      title: new Text('Welcome In SplashScreen',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }

}