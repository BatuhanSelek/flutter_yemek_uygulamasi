import 'package:flutter/material.dart';
import 'package:flutter_yemek_uygulamasi/DetaySayfa.dart';
import 'package:flutter_yemek_uygulamasi/Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];
    var y1 = Yemekler(
        yemek_id: 1,
        yemek_adi: "Köfte",
        yemek_resim_adi: "kofte.png",
        yemek_fiyat: 15.99);
    var y2 = Yemekler(
        yemek_id: 2,
        yemek_adi: "Makarna",
        yemek_resim_adi: "makarna.png",
        yemek_fiyat: 14.99);
    var y3 = Yemekler(
        yemek_id: 3,
        yemek_adi: "Kadayıf",
        yemek_resim_adi: "kadayif.png",
        yemek_fiyat: 8.50);
    var y4 = Yemekler(
        yemek_id: 4,
        yemek_adi: "Baklava",
        yemek_resim_adi: "baklava.png",
        yemek_fiyat: 19.99);
    var y5 = Yemekler(
        yemek_id: 5,
        yemek_adi: "Ayran",
        yemek_resim_adi: "ayran.png",
        yemek_fiyat: 2.0);
    var y6 = Yemekler(
        yemek_id: 6,
        yemek_adi: "Fanta",
        yemek_resim_adi: "fanta.png",
        yemek_fiyat: 4.0);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yemekListesi = snapshot.data;
            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context, indeks) {
                var yemek = yemekListesi[indeks];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detaysayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset(
                                "resimler/${yemek.yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              yemek.yemek_adi,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "${yemek.yemek_fiyat} \u{20BA}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
