import 'package:flutter/material.dart';
import 'package:hello_app/rating.dart';
class Product {
  final String name;
  final String description;
  final String price;
  final String image;
  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product(
            "Điện Thoại Samsung Galaxy Note 20 (8GB/256GB)",
            "Đã từ lâu, sự kết hợp giữa Note và S Pen thông minh định hình nên một thế hệ siêu phẩm, đầy quyền năng, ngay trong tay bạn. Với hiệu năng đáng kinh ngạc như máy tính, khả năng chỉnh sửa, quay video 8K chuyên nghiệp và định chuẩn trải nghiệm vượt trội dành cho game di động, siêu phẩm Note mới hứa hẹn mang đến những đột phá khác biệt, hoàn hảo dù bạn giải trí hay làm việc.  Đây là thế hệ smartphone đổi mới toàn diện cách bạn làm việc và giải trí.",
            "13.999.000",
            "product1.jpg"
        )
    );
    items.add(
        Product(
            "Điện Thoại Samsung Galaxy Z Fold2 5G (12GB/256GB)",
            "Không chỉ là một chiếc điện thoại màn hình gập, Galaxy Z Fold 2 5G còn là chiếc điện thoại có tới 2 màn hình. Trong trạng thái gập, màn hình ngoài của máy với kích thước 6,2 inch, viền mỏng cho trải nghiệm smartphone thông thường, nơi bạn có thể thao tác dễ dàng bằng một tay. Còn muốn trải nghiệm một màn hình lớn hơn, tương đương máy tính bảng, bạn có thể mở ra màn hình gập, điều kỳ diệu sẽ xuất hiện.",
            "20.999.000",
            "product2.jpg"
        )
    );
    items.add(
        Product(
            "Điện thoại Samsung Galaxy A32",
            "Samsung Galaxy A32 4G có mặt lưng nhựa cao cấp với thiết kế đơn giản, trang nhã, không chỉ giúp bảo vệ máy mà còn tăng độ bóng bẩy cho smartphone, mang đến vẻ ngoài đẳng cấp cho người sở hữu.Tổng kích thước thân máy mỏng chỉ 8.4 mm và có trọng lượng 184 g, hai cạnh bên cũng được vát cong nhẹ nhàng nên việc cầm nắm cũng chắc chắn hơn và thuận tiện cho mọi tác vụ.",
            "8.999.000",
            "product3.jpg"
        )
    );
    items.add(
        Product(
            "Điện thoại Samsung Galaxy A72 (8GB/256GB)",
            "Điện thoại Samsung Galaxy A72 8GB/256GB  Hàng chính hãng thiết kế nguyên khối đơn giản, trang nhã. Mặt lưng nhựa nhám cao cấp bóng bẩy, sang trọng và bền đẹp. Kích thước thân máy mỏng chỉ 8.4 mm, phần viền màn hình và cạnh bên vát cong nhẹ nhàng mềm mại tạo cảm giác cầm nắm chắc chắn và thuận tiện cho mọi tác vụ. Mặt lưng nổi bật cụm 4 camera, mặt kính cảm ứng trang bị kính cường lực chắc chắn chống va đập tốt.",
            "11.999.000",
            "product4.jpg"
        )
    );
    items.add(
        Product(
            "iPhone 12 (64GB)",
            "iPhone 12. Mạng 5G giúp tải xuống các bộ phim một cách nhanh chóng và xem trực tuyến video chất lượng cao.1 Màn hình Super Retina XDR 6.1 inch sáng đẹp ấn tượng.2 Ceramic Shield với khả năng chịu va đập khi rơi tốt hơn gấp 4 lần.3 Ảnh chụp tuyệt đẹp trong điều kiện ánh sáng yếu với chế độ Ban Đêm ở tất cả các camera. Quay phim, biên tập và phát video Dolby Vision đẳng cấp điện ảnh. Chip A14 Bionic mạnh mẽ. Hãy để điều thú vị bắt đầu.",
            "22.999.000",
            "product5.jpg"
        )
    );
    return items;
  }
}


class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("appi/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)), Text("Hàng chính hãng"),
                            Text(this.item.price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red.withOpacity(1.0))),
                            RatingBox(),
                          ],
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.name),
      ),
      body: Center(
        child:

        Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("appi/" + this.item.image,height: 400,width: MediaQuery.of(context).size.width,),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                            Text("Giá niêm yết"),
                            Text(this.item.price.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27,color: Colors.red.withOpacity(1.0))),
                            Text("Mô tả sản phẩm ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                            Text(this.item.description),
                            RatingBox(),
                          ],
                        )
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}