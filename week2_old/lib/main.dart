import 'package:flutter/material.dart';
import 'package:hello_app/product.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product Navigation demo home page', key: null,),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        //2
        SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Goa', textScaleFactor: 1),
            background: Image.asset(
              'assets/images/beach.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        //3
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (_, int index) {
              return GestureDetector(
                child: ProductBox(item: items[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(item: items[index]),
                    ),
                  );
                },
              );

            },
            childCount: 6,
          ),
        ),
      ],
    ),
    );
  }

}


