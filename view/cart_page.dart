import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';

class CadtView extends StatefulWidget {
  const CadtView({super.key});

  @override
  State<CadtView> createState() => _CadtViewState();
}

class _CadtViewState extends State<CadtView> {
  var con;
  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 246, 246),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Icon(
                Icons.arrow_back,
                color: secondary,
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("back", style: TextStyle(color: secondary))),
          backgroundColor: primary,
        ),
      ),
      body: getBody(),
    );
    
  }

  Widget getBody() {
    var size = MediaQuery.of(con).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "cart",
                style: TextStyle(
                    color: black, fontSize: 30, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: List.generate(
                    3,
                    (index) => Container(
                          child: Container(
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.only(
                              right: 25,
                              left: 25,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 50,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/1.jpg"),
                                              fit: BoxFit.fill))),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "sdfs",
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("sdfs"),
                                        Row(
                                          children: [
                                            Text("Quanoty : "),
                                            Text("1"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.delete_outline,
                                    color: red,
                                  )
                                ]),
                          ),
                        )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "bail",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Totale Price",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Taxes",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                          color: secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            // padding: EdgeInsets.all(10),
            height: 80,
            width: size.width,
            color: secondary,
            child: Center(
              child: Text(
                "Ceckout(\$300.00)",
                style: TextStyle(
                    color: primary, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
