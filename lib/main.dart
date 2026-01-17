import 'package:flutter/material.dart';
import 'package:w3_jantira/api_service.dart';
import 'product_model.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService.fetchproduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return Center(child: Text('เกิดข้อผิดพลาด'));
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length, itemBuilder: (context, index) {
            final p = products[index];

            return Container(child: Row(
                children: [Image.network(p.photo, width: 100, height: 100,),
                  Text(p.name)]));
          },
          );
        },
      ),
    );
  }

}