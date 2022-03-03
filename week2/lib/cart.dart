import 'package:flutter/material.dart';
import 'package:hello_app/product.dart';
import 'package:hello_app/main.dart';
import 'package:hello_app/globals.dart' as glb;

class Cart extends StatefulWidget {
  final List<Product> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Product> _cart;

  int total(List<Product> cart) {
    return cart.fold(0, (sum, item) => sum + item.price);
  }

  void _showDialog(BuildContext context) {
    // user defined function void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context, builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Thanh toán"),
        content: new Text("Thanh toán thành công"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Đóng"),
            onPressed: () {
              _cart.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Home',),
                ),
              );
            },
          ),
        ],
      );
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Home',),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(glb.formatter.format(item.price).toString()),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
      bottomSheet: BottomSheet(
        onClosing: () {

        },
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(14.0),
            height: 130,
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Tổng cộng"),
                  Text(glb.formatter.format(total(_cart)).toString() + "đ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27,color: Colors.red.withOpacity(1.0))),
                ]
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_cart.length!=0) {
            _showDialog(context);
          }
        },
        label: Text(_cart.length!=0 ? "Thanh toán" : "Giỏ hàng không có gì!"),
        icon: Icon(_cart.length!=0 ? Icons.done : Icons.close),
        backgroundColor: Colors.red,
      ),
    );
  }
}