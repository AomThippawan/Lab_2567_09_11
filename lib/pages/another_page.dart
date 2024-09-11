import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? name;
  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
    });
  }

  void RemoveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
  }

  @override
  //ทำครั้งแรกครั้งเดียว
  void initState() {
    loadData();
    super.initState();
  }
  // Declare your function to load data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Another Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text(
                  name ?? "รอสักครู่",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text('ย้อนกลับ')),
                    ElevatedButton(
                        onPressed: () {
                          RemoveData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                        },
                        child: Text('ไปหน้าแรก')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
