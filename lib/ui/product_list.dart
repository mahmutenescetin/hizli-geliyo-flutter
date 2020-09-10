import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async {
  String url = "https://fakestoreapi.com/products";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Shape.png'),
                color: Color.fromRGBO(255, 217, 83, 1),
              ),
              title: Text(''),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/dots-icon-20.jpg'),
              color: Color.fromRGBO(82, 86, 92, 1),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Vector.png'),
                color: Color.fromRGBO(82, 86, 92, 1),
              ),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromRGBO(82, 86, 92, 1),
              ),
              title: Text(''),
              backgroundColor: Colors.blue),
        ],
      ),
      body: _children[0],
    );
  }
}

final List<Widget> _children = [
  jsonCreater(),
];

Widget jsonCreater() {
  return Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,
          child: Stack(
            children: [
              Material(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Kategori veya ürün ara"),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFF55AB68),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFF4181E5),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFFE79C59),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFFDB615C),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Color(0xFFB071D3),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                            color: Color(0xFF74CAEE),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List items = snapshot.data;

              return GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 4,
                              maxHeight: MediaQuery.of(context).size.width / 4,
                            ),
                            child: Image(
                              image: NetworkImage("${items[i]["image"]}"),
                            ),
                          ),
                          Text("${items[i]["title"]}",
                              style: GoogleFonts.titilliumWeb(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Row(
                            children: [
                              Text(
                                "${items[i]["price"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromRGBO(45, 156, 219, 1)),
                              ),
                              Text('TL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color.fromRGBO(45, 156, 219, 1)))
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ],
  );
}
//NetworkImage("${items[i]["image"]}")
/*Text(
"${items[i]["category"]}",
style:
TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
),*/
