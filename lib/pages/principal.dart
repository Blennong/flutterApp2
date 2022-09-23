import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Principal extends StatelessWidget {
  const Principal({super.key});


  Widget cuadro1(String text, int valor){
    return Container(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            children: [
              Text(
                'Fecha : ' + valor.toString()
              ),
              Text(
                'Magnitud'
              ),
              Text(
                'Profundidad'
              ),
              Text(
                'Lugar'
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),           
        ),
        color: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context){
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
            cuadro1("Hola", 12312312),
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