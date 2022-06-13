import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Text("GetX State Management")),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
       
        body: Column(
          children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Obx(() => Text("Clicks Ke: ${c.count}", style: TextStyle(fontSize: 30),)),
                ),

            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(20),
                child: Row(
                  

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    ElevatedButton(
                        child: Text("Halaman 1"), onPressed: () => Get.to(Pertama())),
                         ElevatedButton(
                        child: Text("Halaman 2"), onPressed: () => Get.to(Kedua())),
                         ElevatedButton(
                        child: Text("Halaman 3"), onPressed: () => Get.to(Ketiga())),
                  ],
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}
class Pertama extends StatelessWidget {
  
  
  
  final Controller c = Get.find();
    final Controller d = Get.put(Controller());


  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Halaman Pertama Getx State ke")),
            ],
          ),
                    Center(child: Text("${c.count}")),

        ],
        
      ),
      
      
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: d.increment),
    );
  }
}

class Kedua extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Halaman Getx State")),
         
             
            ],
          ),
           Center(child: Text("${c.count}")),

        ],
        
      ),
      
    );
  }
}
class Ketiga extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("Halaman Getx Ketiga")),
             
            ],
          ),
           Center(child: Text("${c.count}")),

        ],
        
      ),
      
    );
  }
}
