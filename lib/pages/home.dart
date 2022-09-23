import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trabajo_2/dto/sismos_dto.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<SismosDto> fsismos;
  late Future<SismosDto> fsismos1;
  late Future<SismosDto> fsismos2;

  @override
  void initState() {
    super.initState();
    fsismos = obtValoresIndex0();
    fsismos1 = obtValoresIndex1();
    fsismos2 = obtValoresIndex2();
  }
  //INDEX0
  Future<SismosDto> obtValoresIndex0() async {
    print("consultando datos");
    var url = Uri.parse("https://api.gael.cloud/general/public/sismos");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      // return SismosDto.fromJson(jsonDecode(response.body));
      List<dynamic> list = json.decode(response.body);
      SismosDto index0 = SismosDto.fromJson(list[0]);
      return index0;
    } else {
      throw Exception("fallo");
    }
  }
  //INDEX1
  Future<SismosDto> obtValoresIndex1() async {
    print("consultando datos");
    var url = Uri.parse("https://api.gael.cloud/general/public/sismos");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      // return SismosDto.fromJson(jsonDecode(response.body));
      List<dynamic> list = json.decode(response.body);     
      SismosDto index1 = SismosDto.fromJson(list[1]);
      return index1;
    } else {
      throw Exception("fallo");
    }
  }
  //INDEX2
  Future<SismosDto> obtValoresIndex2() async {
    print("consultando datos");
    var url = Uri.parse("https://api.gael.cloud/general/public/sismos");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      // return SismosDto.fromJson(jsonDecode(response.body));
      List<dynamic> list = json.decode(response.body);
      SismosDto index2 = SismosDto.fromJson(list[2]);
      return index2;
    } else {
      throw Exception("fallo");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("pase por aca");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Refresca el widget
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh_outlined),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Últimos 3 sismos registrados",
          style: TextStyle(color: Colors.black),
        )),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15,),
              FutureBuilder<SismosDto>(
                future: obtValoresIndex0(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Card(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.blue[300],
                      child: SizedBox(
                        width: 300,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 4),
                              child: Text(
                                'Fecha: ${snapshot.data!.fecha}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Magnitud: ${snapshot.data!.magnitud}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Profundidad: ${snapshot.data!.profundidad}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Lugar: ${snapshot.data!.refGeografica}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),           
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // print(snapshot);
                    print("Error");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
              const SizedBox(height: 15,),
              FutureBuilder<SismosDto>(
                future: obtValoresIndex1(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Card(
                      color: Colors.green[300],
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SizedBox(
                        width: 300,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 4),
                              child: Text(
                                'Fecha: ${snapshot.data!.fecha}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Magnitud: ${snapshot.data!.magnitud}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Profundidad: ${snapshot.data!.profundidad}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Lugar: ${snapshot.data!.refGeografica}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),           
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // print(snapshot);
                    print("Error");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
              const SizedBox(height: 15,),
              FutureBuilder<SismosDto>(
                future: obtValoresIndex2(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Card(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.amber[800],
                      child: SizedBox(
                        width: 300,
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 4),
                              child: Text(
                                'Fecha: ${snapshot.data!.fecha}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Magnitud: ${snapshot.data!.magnitud}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Profundidad: ${snapshot.data!.profundidad}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 0, 2),
                              child: Text(
                                'Lugar: ${snapshot.data!.refGeografica}',
                                style: const TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),           
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // print(snapshot);
                    print("Error");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
