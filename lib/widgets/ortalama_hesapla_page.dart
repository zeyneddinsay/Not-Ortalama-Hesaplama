// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/appconstants.dart';
import 'package:not_ortalama_hesaplama/helper/data_helper.dart';
import 'package:not_ortalama_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //form
            //liste
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _BuildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(dersSayisi: 1, ortalama: 4.85),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text("liste buraya gelecek"),
                color: Colors.blue,
              ),
            )
          ],
        ));
  }

  Widget _BuildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFromField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "matematik",
          border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius,
          ),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  _buildHarfler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red.shade300.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<double>(
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Colors.indigo.shade200,
        onChanged: (deger) {
          setState(() {
            secilenDeger = deger!;
            print(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
