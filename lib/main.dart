import 'package:courses/course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'course_details_screen.dart';
import 'fixed_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? data;
   //load data from txt file
  Future<void> loadData(int index) async {
    final _loadedData = await rootBundle.loadString(contentPathList[index]);
    data = _loadedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          0,
          31,
          132,
        ),
        title: const Text('Route App one'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                loadData(index);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetailsScreen(
                    imagePath: imagesPath[index],
                    content: data,
                  ),
                ));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          imagesPath[index],
                          fit: BoxFit.fill,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: double.infinity,
                        color: const Color.fromARGB(
                          255,
                          16,
                          74,
                          210,
                        ),
                        //padding: const EdgeInsets.only(top: 8),
                        child: Center(
                            child: Text(
                          courses[index],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
