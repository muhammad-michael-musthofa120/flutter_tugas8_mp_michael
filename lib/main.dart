import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title1 = "State Management Default";
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Michael Tugas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/pertama',
      routes: {
        '/pertama': (context) => const MyHomePage(title: 'Halaman Pertama'),
        '/kedua': (context) => const SecondPage(),
        '/ketiga': (context) => const ThirdPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'State Management Default Flutter',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            child: Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              child: FloatingActionButton(
                    tooltip: "Halaman Satu",

                child: Icon(Icons.numbers_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, '/kedua',
                      arguments: Data('$_counter', 'Halaman Kedua'));
                },
              ),
            ),
          ),
         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: Container(
                  
       
                  
                  child: FloatingActionButton(
                    tooltip: "Halaman dua",
                    child: Icon(Icons.format_list_numbered_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/ketiga',
                          arguments: Data('$_counter', 'Halaman kedua'));
                    },
                  ),
                ),
              ),
            ),
          ),
        ])),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 50, color: Colors.blue)),
          ),
          Center(
            child: Text("Halaman Dua"),
          )
          
          
        ],
        
      ),
         floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 246, 189, 189),
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 50, color: Colors.blue)),
          ),
          
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Data {
  final String title;
  final String count;

  Data(this.count, this.title);
}
