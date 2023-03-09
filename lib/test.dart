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
              Expanded(
                child: TextField(
                  controller: _cityController,
                  decoration: InputDecoration(hintText: "Enter $cityName name"),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(Duration(milliseconds: 3000), () async {
                      try {
                        var response = await http.post(
                            Uri.parse("https://mybackend/cities"),
                            body: '{"city_name":"name"}'
                                .replaceAll("name", _cityController.text),
                            headers: {
                              "Authorization":
                                  "${(await SharedPreferences.getInstance()).getString("TOKEN")}"
                            });
                        setState(() {
                          isLoading = false;
                        });
                        d = response.body;
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        setState(() {
                          isError = true;
                        });
                        print("Error: $e");
                        rethrow;
                      }
                    });
                  },
                  child: const Text("Generate")),
            ],
          ),
          buildBody(context)
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            child: Column(
              children: [
                Text("MANILA"),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "HISTORY",
                    ),
                    TextSpan(
                      text: "TEXT",
                    ),
                  ]),
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
                    Column(
                      children: [Text("Temperature:"), Text("100*")],
                    ),
                    Container(
                      height: 20.0,
                      decoration:
                          BoxDecoration(border: Border(right: BorderSide())),
                    ),
                    Column(
                      children: [Text("Unit:"), Text("123")],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
