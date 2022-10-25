import 'package:flkv/flkv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var db = ZPass();
            await db.open();
            var key = "key_test";
            var value = "value_test";
            db.put(key, value);
            var valueResult = db.get(key);
            print("value: $valueResult");
            var value2 = "value_test2";
            db.put("${key}2", value2);
            valueResult = db.get(key);
            print("value: $valueResult");
            var records = db.list();
            records.forEach((element) {
              print(element.key + " - " + element.value);
            });
            db.delete(key);
            records = db.list();
            records.forEach((element) {
              print(element.key + " - " + element.value);
            });
            computeTime(() => db.close(), des: "db close");
          },
          child: Icon(Icons.sync),
        ),
      ),
    );
  }

  T computeTime<T>(T Function() func, {String des = ""}) {
    var start = DateTime.now();
    var data = func();
    print("$des cost:${DateTime.now().difference(start).inMilliseconds}");
    return data;
  }

  void _test() async {
    final tmpDir = await getTemporaryDirectory();
    print("tempDir root: $tmpDir");
  }
}
