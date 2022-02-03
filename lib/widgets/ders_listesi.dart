import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/helper/data_helper.dart';
import 'package:not_ortalama_hesaplama/model/ders.dart';

class DersListe extends StatefulWidget {
  final Function onElemanCikarildi;
  const DersListe({
    required this.onElemanCikarildi,
    Key? key,
  }) : super(key: key);

  @override
  State<DersListe> createState() => _DersListeState();
}

class _DersListeState extends State<DersListe> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi:
                  (index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} kredi, Not değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child: Text(
              "lütfen ders ekleyin",
            )),
          );
  }
}
