import 'package:flutter/material.dart';
import 'dart:convert'; // jsonDecodeを使うために必要
import 'package:http/http.dart' as http; // http package
import 'package:test5/detail_page.dart'; // 作成したDetailPageをimport

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'getAPI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JSONデータを使った一覧・詳細表示'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> jsonUrls = [];

  void getJsonData() async {
    try {
      List<Map<String, dynamic>> list = [];
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      // print('responseの型: ${response.runtimeType}');
      List<dynamic> data = json.decode(response.body);
      data.forEach((element) {
        list.add(element); // ②だからここで一度別の変数にまとめて入れている
      });
      setState(() { // ①画面の更新だからなるべくシンプルに。その処理だけ入れられるようにする。
        jsonUrls = list;
      });
      print('jsonUrlsの型: ${jsonUrls.runtimeType}');
      // print('jsonUrlsの中身: ${jsonUrls}');
    } catch (e) {
      print('例外処理が発生');
      print(e);
    }
  }

  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: jsonUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(jsonUrls[index]['name']),
                subtitle: Text(jsonUrls[index]['username']),
                onTap: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(
                  builder: (context) => DetailPage(
                    jsonUrls: jsonUrls[index],
                  ),
                  ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}