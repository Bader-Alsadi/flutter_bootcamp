
import 'package:app/day34_35/models/order.dart';
import 'package:app/day34_35/models/pizza.dart';
import 'package:app/day34_35/pages/order_cobtrol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum sizePizza { smale, medium, large }

enum pizzasenum {
  ChooseOne,
  Pepperoni,
  Sausage,
  Garllic_Sauce,
}

class PizzaOrderApp extends StatefulWidget {
  const PizzaOrderApp({super.key});

  @override
  State<PizzaOrderApp> createState() => _PizzaOrderAppState();
}

class _PizzaOrderAppState extends State<PizzaOrderApp> {
  OrderControl orderControl = OrderControl();
  String dropDownValue = pizzasenum.values[0].name;
  String? radoiGroupValue;
  bool SpecialInstructions = false;
  List<String> SpecialInstructionsList = [];
  bool gluttenFree = false;
  List<String> topping = [];
  TextEditingController Textco = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Pizza Order ",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("size"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      sizePizza.values.length,
                      (index) => RadioMenuButton(
                          value: sizePizza.values[index].name,
                          groupValue: radoiGroupValue,
                          onChanged: (value) {
                            radoiGroupValue = value;

                            setState(() {});
                          },
                          child: Text(sizePizza.values[index].name))),
                ),
                Divider(
                  thickness: 2,
                ),
                radoiGroupValue == null
                    ? Container()
                    : Column(
                        children: [
                          Text("topping"),
                          DropdownButton<String>(
                              value: dropDownValue,
                              items: List.generate(
                                  pizzasenum.values.length,
                                  (index) => DropdownMenuItem(
                                      enabled: index == 0 ? false : true,
                                      value: pizzasenum.values[index].name
                                          .replaceAll("_", " "),
                                      child: Text(pizzasenum.values[index].name
                                          .replaceAll("_", " ")))),
                              onChanged: (value) {
                                dropDownValue = value!;
                                if (!topping.any((element) => element == value))
                                  topping.add(value);
                                setState(() {});
                              }),
                          Column(
                            children: List.generate(
                                topping.length,
                                (index) => Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              topping.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Icon(
                                                Icons.remove_circle_outline)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(topping[index],
                                            style:
                                                TextStyle(color: Colors.black))
                                      ],
                                    )),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          CheckboxListTile(
                              title: Text(
                                "GluttenFree",
                                style: TextStyle(color: Colors.black),
                              ),
                              value: gluttenFree,
                              onChanged: (value) {
                                gluttenFree = value!;
                                setState(() {});
                              }),
                          CheckboxListTile(
                              title: Text(
                                "Special Instructions",
                                style: TextStyle(color: Colors.black),
                              ),
                              value: SpecialInstructions,
                              onChanged: (value) {
                                SpecialInstructions = value!;
                                setState(() {});
                              }),
                          SpecialInstructions
                              ? TextFormField(
                                  maxLines: 2,
                                  controller: Textco,
                                  maxLength: 100,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      contentPadding: EdgeInsets.all(20)),
                                )
                              : Container(),
                        ],
                      ),
                SizedBox(
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          side: BorderSide(
                            color: Colors.blue,
                          )),
                      onPressed: radoiGroupValue == null
                          ? null
                          : () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: Text("Are you sure"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              int id =
                                                  orderControl.allOrder.isEmpty
                                                      ? 1
                                                      : int.parse(orderControl
                                                              .allOrder
                                                              .last
                                                              .id) +
                                                          1;

                                              if (SpecialInstructions)
                                                SpecialInstructionsList.addAll(
                                                    Textco.text.split(" "));

                                              orderControl.addOrder(Order(
                                                  id: id.toString(),
                                                  pizza: Pizza(
                                                      name: dropDownValue,
                                                      size: radoiGroupValue!,
                                                      topping: topping,
                                                      SpecialInstructions:
                                                          SpecialInstructionsList,
                                                      isgluttenFree:
                                                          gluttenFree)));
                                              final snackBar = SnackBar(
                                                  content: const Text(
                                                      "added sessccefully"));

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            child: Text("yes")),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("cacel")),
                                      ],
                                    );
                                  });
                            },
                      child: RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.shopping_cart_sharp,
                          color: Colors.blue,
                        )),
                        TextSpan(
                            text: " Confirm ",
                            style: TextStyle(color: Colors.black)),
                        WidgetSpan(
                            child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                      ]))),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                      orderControl.allOrder.length,
                      (index) => Card(
                            child: ListTile(
                              title:
                                  Text(orderControl.allOrder[index].pizza.name),
                              subtitle: Text(orderControl
                                  .allOrder[index].pizza.topping
                                  .join("/")),
                              trailing: Column(
                                children: [
                                  Text(orderControl.allOrder[index].pizza.size),
                                  orderControl
                                          .allOrder[index].pizza.isgluttenFree
                                      ? Icon(
                                          Icons.adb,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.adb,
                                          color: Colors.red,
                                        ),
                                ],
                              ),
                            ),
                          )),
                )
              ],
            )),
      ),
    );
  }
}
