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

  Widget cuadro1(String text, String? valor) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.green[200]!,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              valor.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Center(child: Text(text)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("pase por aca");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
          "Indicadores",
          style: TextStyle(color: Colors.black),
        )),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<SismosDto>(
              future: obtValoresIndex0(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Card(
                      child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Column(
                          children: [
                            Text(
                              'Fecha : ' + snapshot.data!.fecha.toString()
                            ),
                            Text(
                              'Magnitud' + snapshot.data!.magnitud.toString()
                            ),
                            Text(
                              'Profundidad' + snapshot.data!.profundidad.toString()
                            ),
                            Text(
                              'Lugar' + snapshot.data!.refGeografica.toString()
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),           
                      ),
                    color: Colors.green,
                    ),
                  );
                } else if (snapshot.hasError) {
                    print(snapshot);
                    print("Error");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            FutureBuilder<SismosDto>(
                future: obtValoresIndex1(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      cuadro1("Valor Uf", snapshot.data!.magnitud),
                      const SizedBox(height: 20),
                    ]);
                  } else if (snapshot.hasError) {
                    print(snapshot);
                    print("Error");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            FutureBuilder<SismosDto>(
                future: obtValoresIndex2(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      cuadro1("Valor Uf", snapshot.data!.magnitud),
                      const SizedBox(height: 20),
                    ]);
                  } else if (snapshot.hasError) {
                    print(snapshot);
                    print("Error");
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
                
          ],
        ),
      ),
    );
  }
}
