import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabajo N°2'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text(
              "Últimos 3 sismos registrados", 
              style: TextStyle(
                fontSize: 20
              ),),
            SizedBox(height: 30,),
            Card(
              child: SizedBox(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Contenido'
                    ) 
                  ),
                ) 
              ),
              color: Colors.green,
            ),
            SizedBox(height: 30,),
            Card(
              child: SizedBox(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Contenido'
                    ) 
                  ),
                ) 
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 30,),
            Card(
              child: SizedBox(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Contenido'
                    ) 
                  ),
                ) 
              ),
              color: Colors.amber,
            )
          ],
        ),
      ) 
    );
  }
}