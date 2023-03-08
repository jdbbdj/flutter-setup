import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);
  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  bool? hasError;
  final _l = true;
  final cityName = "City";
  String? d;
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
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(hintText: "Enter $cityName name"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      var response = await http.post(
                          Uri.parse("https://mybackend/cities"),
                          body: '{"city_name":"name"}'
                              .replaceAll("name", _cityController.text),
                          headers: {"Authorization": "YES"});
                      d = response.body;
                    } catch (e) {
                      print("Error: $e");
                      rethrow;
                    }
                  },
                  child: const Text("Navigate to test")),
            ],
          ),
          buildBody(context)
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    String rg = '"(weather)":"((\\"|[^"])*)"';
    String? w = RegExp(rg).firstMatch(d!)?.group(2);
    return _l
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : hasError!
            ? Container()
            : Card(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                          "City:${RegExp('"(name)":"((\\"|[^"])*)"').firstMatch(d!)?.group(2)}"),
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "History:\n",
                          ),
                          TextSpan(
                            text: RegExp('"(name)":"((\\"|[^"])*)"')
                                .firstMatch(d!)
                                ?.group(2),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      height: 750.0,
                      child: Image.network(
                        "${RegExp('"(image_url)":"((\\"|[^"])*)"').firstMatch(d!)?.group(2)}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text("Temperature:"),
                              Text(
                                  "${RegExp('"(temp)":"((\\"|[^"])*)"').firstMatch(w!)?.group(2)}")
                            ],
                          ),
                        ),
                        Container(
                          height: 20.0,
                          decoration: BoxDecoration(
                              border: Border(right: BorderSide())),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("Unit:"),
                              Text(
                                  "${RegExp('"(unit)":"((\\"|[^"])*)"').firstMatch(w)?.group(2)}")
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
  }
}
