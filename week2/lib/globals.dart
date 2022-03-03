library my_prj.globals;
import 'package:hello_app/product.dart';
import 'package:intl/intl.dart';

List<Product> cartList = <Product>[];
Product currentProduct = new Product("null","null",0,"null");
var formatter = NumberFormat('###,###,###,###');