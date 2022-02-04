// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/appconstants.dart';
import 'package:not_ortalama_hesaplama/helper/data_helper.dart';
import 'package:not_ortalama_hesaplama/model/ders.dart';
import 'package:not_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:not_ortalama_hesaplama/widgets/harf_drop_down_widget.dart';
import 'package:not_ortalama_hesaplama/widgets/kredi_drop_down_widget.dart';
import 'package:not_ortalama_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla()),
                )
              ],
            ),
            Expanded(
              child: DersListe(
                onElemanCikarildi: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  print("eleman çıkarıldı index $index");
                  setState(() {});
                },
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFromField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: KrediDropdownWidget(onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    })),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Colors.teal,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFromField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders adını giriniz";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);

      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
