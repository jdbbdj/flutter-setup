import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  bool isError = false;
  bool isLoading = false;
  final cityName = "City";
  String d = "";

  var mock = {
    "city": "Manila",
    "temp": "47",
    "name": "James",
    "unit": "123",
    "history": "Bacon ipsum"
  };

  String regExpInitiation(String name) {
    return '"($name)":"((\\"|[^,"])*)"';
  }

  RegExp printText(String text) {
    return RegExp(text);
  }

  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Weather Page",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration:
                        InputDecoration(hintText: "Enter $cityName name"),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(Duration(milliseconds: 1500), () async {
                    try {
                      var response = await http.post(
                          Uri.parse("https://mybackend/cities"),
                          body: '{"city_name":${_cityController.text}}',
                          headers: {
                            "Authorization":
                                "${(await SharedPreferences.getInstance()).getString("TOKEN")}"
                          });
                      setState(() {
                        isLoading = false;
                      });
                      d = json.encode(mock);
                      print(d);
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      setState(() {
                        isError = true;
                      });
                      d = json.encode(mock);
                      print(d);
                      print("Error: $e");
                      rethrow;
                    }
                  });
                },
                child: const Text("Generate")),
            SizedBox(height: 20.0),
            buildBody(context),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                  )
                ]),
            child: Card(
              child: Column(
                children: [
                  Text(
                    "${printText(regExpInitiation('city')).firstMatch(d)?.group(2)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "HISTORY: ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        TextSpan(
                            text:
                                "${printText(regExpInitiation('history')).firstMatch(d)?.group(2)}",
                            style: const TextStyle(color: Colors.black)),
                      ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    height: 180.0,
                    child: SvgPicture.asset(
                      'images/departing.svg',
                      width: 180,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Temperature:"),
                            Text(
                                "${printText(regExpInitiation('temp')).firstMatch(d)?.group(2)}")
                          ],
                        ),
                      ),
                      Container(
                        height: 20.0,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            spreadRadius: 2,
                          )
                        ]),
                      ),
                      Column(
                        children: [
                          Text("Unit:"),
                          Text(
                              "${printText(regExpInitiation('unit')).firstMatch(d)?.group(2)}")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
