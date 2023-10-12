import 'package:flutter/material.dart';

import '../modles/produc.dart';

class Multipro extends StatelessWidget {
   Multipro(this.produs,{Key? key,}) : super(key: key);
   List<ProductModel> produs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("producs detlies ",style: TextStyle(color: Colors.black),),
      ),
      body: ListView.builder(
        itemCount:produs.length ,
        itemBuilder: (c,index){return  Padding(
          padding: EdgeInsets.only(top: 20),
          child: ListTile(
            title: Text("${produs[index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("${produs[index].description}",style: TextStyle(fontWeight: FontWeight.bold),),
            // trailing:Text("${produs[index].price}",style: TextStyle(fontWeight: FontWeight.bold),) ,
            trailing:Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage("assets/image/index.jpeg",),
                    fit: BoxFit.cover,

                  )
              ),
            ),
          ),
        );
            // Container(
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         left: 320,
            //         child: CircleAvatar(
            //           radius: 25,
            //           backgroundColor: Colors.red,
            //           child: Text("${produs[index].discountPercentage}"),
            //         ),
            //       ),
            //       Image.asset("assets/image/index.jpeg"),
            //     ],
            //   ),
            // ),


          }
      ),
    );
  }
}
