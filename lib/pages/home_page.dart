import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/another_page.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare your variable for data
  String? name;
  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
    });
  }

  @override
  //ทำครั้งแรกครั้งเดียว
  void initState() {
    loadData();
    super.initState();
  }

  @override
  //ส่วนใหญ่ใช้ clear memory / clear value / clear
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  //ทำตลอดเวลาที่รันหน้า
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
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
                                  builder: (context) => AnotherPage()));
                        },
                        child: Text('ถัดไป')),
                  ],
                )
              ],
            ),
          ),
        )

        // ),

        );
  }
}
