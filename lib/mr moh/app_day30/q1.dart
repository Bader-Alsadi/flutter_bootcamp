import 'package:app/mr%20moh/app_day30/regsted.dart';
import 'package:app/mr%20moh/app_day30/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  late List<Regsted> listr;
  Register({required this.listr, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> frmKey = GlobalKey();
  TextEditingController nameText = TextEditingController();
  TextEditingController phonText = TextEditingController();
  TextEditingController passText = TextEditingController();
  TextEditingController rPassText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
            key: frmKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (x) {
                    if (x!.isEmpty)
                      return "Enter Name";
                    else {
                      if (x!.length > 3)
                        return null;
                      else
                        return "Length most be more then 3";
                    }
                  },
                  onChanged: ((x) {
                    if (frmKey.currentState!.validate()) {}
                  }),
                  controller: nameText,
                  decoration: InputDecoration(
                    hintText: "Enter  Name",
                    label: Text(
                      "Name",
                      style: TextStyle(fontSize: 18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phonText,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]+'))
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter Phone number",
                    label: Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (x) {
                    if (x!.isEmpty)
                      return "Enter Password";
                    else
                      return null;
                  },
                  controller: passText,
                  decoration: InputDecoration(
                    hintText: "Enter Enter Password",
                    label: Text(
                      "Enter Password",
                      style: TextStyle(fontSize: 18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (x) {
                    if (x!.isEmpty)
                      return "Enter Enter Password";
                    else {
                      if (x == passText.text)
                        return null;
                      else
                        return "Length most be more then 3";
                    }
                  },
                  onChanged: ((x) {
                    if (frmKey.currentState!.validate()) {}
                  }),
                  controller: rPassText,
                  decoration: InputDecoration(
                    hintText: "Enter Enter Password",
                    label: Text(
                      "Enter RPassword",
                      style: TextStyle(fontSize: 18),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          nameText.text = "";
                          phonText.text = "";
                          passText.text = "";
                          rPassText.text = "";
                          setState(() {});
                        },
                        child: Text("clear")),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          nameText.text = "";
                          setState(() {});
                        },
                        child: Text("clear name filed")),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c) {
                          widget.listr.add(Regsted(
                              name: nameText.text,
                              phone: phonText.text,
                              passwprd: passText.text));
                          return TableDart(regestd: widget.listr);
                        }));
                      },
                      child: Text("submit")),
                ),
              ],
            )),
      ),
    );
  }
}
