import 'package:app/day73/featuer/viewModel/exchage_moany.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addcurrncy extends StatelessWidget {
  const Addcurrncy({super.key});

  @override
  Widget build(BuildContext context) {
    final evm = Provider.of<ExchangeMaonyVM>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: evm.currencyList
            .map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text("\$ ${e.value * evm.rialY}"),
                  trailing: InkWell(
                    onTap: () {
                      evm.toggleCurrency(evm.currencyList.indexOf(e));
                    },
                    child: Icon(
                      Icons.check_circle,
                      color: e.isActive ? Colors.green : Colors.grey,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
