import 'package:flkv/flkv.dart';
import 'package:flkv/ffi.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
            var dbName = "test";
            final applicationDocDir = await getTemporaryDirectory();
            var dbPath = join(applicationDocDir.path, dbName);
            var levelDB = LevelDB(dbPath);
            print("open db ${levelDB.getPath()}");
            await levelDB.open();
            print("open db ${levelDB.getPath()} completed");

            var putResult = await levelDB.put("key", "test1111");
            print("put result: ${putResult}");

            await levelDB.put("key23232", "test2341341");

            var value = await levelDB.get("key");
            print("value: $value");
            var rows = await levelDB.list();
            rows.forEach((element) {
              print("row -> ${element.key} - ${element.value}");
            });

            await levelDB.delete("key");
            print("delete key");

            var newRows = await levelDB.list();
            newRows.forEach((element) {
              print("row -> ${element.key} - ${element.value}");
            });

            var closeResult = await levelDB.close();
            print("close result: $closeResult");
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
