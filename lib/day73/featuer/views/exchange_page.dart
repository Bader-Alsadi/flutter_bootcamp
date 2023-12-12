import 'package:app/day73/featuer/viewModel/exchage_moany.dart';
import 'package:app/day73/featuer/views/addCurruncy_page.dart';
import 'package:app/services_provider/core/widgets/custom_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangePage extends StatelessWidget {
  ExchangePage({super.key});
  TextEditingController rialY = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final evm = Provider.of<ExchangeMaonyVM>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Addcurrncy()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                  evm.currencyList.where((element) => element.isActive).length >
                          0
                      ? Icons.favorite
                      : Icons.heart_broken),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                "favourited currancy : ${evm.currencyList.where((element) => element.isActive).length}"),
            Customfiled(
              filterPattern: '[0-9]+',
              onchange: (String value) {
                if (value != '') evm.setRialY = double.parse(value);
              },
              lable: "${evm.rialY}",
              controller: rialY,
              filedType: TextInputType.phone,
            ),
            Column(
              children: evm.currencyList
                  .map((e) => e.isActive
                      ? ListTile(
                          title: Text(e.name),
                          subtitle: Text("\$ ${evm.rialY / e.value}"),
                          trailing: InkWell(
                            onTap: () {
                              evm.toggleCurrency(evm.currencyList.indexOf(e));
                            },
                            child: Icon(
                              Icons.check_circle,
                              color: e.isActive ? Colors.green : Colors.grey,
                            ),
                          ),
                        )
                      : Container())
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
