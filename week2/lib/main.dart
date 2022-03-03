import 'package:flutter/material.dart';
import 'package:hello_app/product.dart';
import 'package:hello_app/cart.dart';
import 'package:hello_app/globals.dart' as glb;

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
      debugShowCheckedModeBanner: false,
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
            title: Text('UET Phone Store', textScaleFactor: 1),
            background: Image.asset(
              "appi/smiley.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          automaticallyImplyLeading: false,
        ),

        //3
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (_, int index) {
              return GestureDetector(
                child: ProductBox(item: items[index]),
                onTap: () {
                  glb.currentProduct = items[index];
                  print(glb.currentProduct.name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(item: items[index]),
                    ),
                  );
                },
              );

            },
            childCount: 5,
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cart(glb.cartList),
          ),
        );
        },
      backgroundColor: Colors.red,
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          size: 36.0,
        ),
        if (glb.cartList.length > 0)
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(
                glb.cartList.length.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
      ],
    ),
    ),
    );
  }

}


