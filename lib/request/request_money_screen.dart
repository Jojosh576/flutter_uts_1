import 'package:flutter/material.dart';
import 'request_money_transaction.dart';

class RequestMoneyScreen extends StatelessWidget {
  final double saldo;

  RequestMoneyScreen({super.key, required this.saldo});

  final List<String> profileImage = [
    "https://i.pinimg.com/236x/6e/a8/02/6ea802b32f53cda0bf7542059d174481.jpg",
    "https://i.pinimg.com/474x/ac/d5/98/acd598cb8047ab7ca5e8297418859d64.jpg",
    "https://i.pinimg.com/236x/96/ee/89/96ee8951039b86145c40285756044e46.jpg",
    "https://i.pinimg.com/236x/14/41/83/144183f7ca5d1fa792da67a581e76736.jpg",
    "https://i.pinimg.com/236x/f9/c9/a1/f9c9a107c5f0d0031073b6eb6f8d9c4e.jpg",
    "https://i.pinimg.com/236x/66/4d/21/664d21c6ba8b159769f23b25f2adc28a.jpg",
    "https://i.pinimg.com/474x/61/c4/58/61c458f08b883c02436f51f3c80bf328.jpg",
    "https://i.pinimg.com/474x/57/f9/83/57f98343940da0376fa81a2fa5417983.jpg"
  ];

  final List<String> names = [
    "Rajoo",
    "Fabian",
    "Sindu",
    "Jojo",
    "Bryan",
    "Gerald",
    "Ujang",
    "Xiaoyu"
  ];

  @override
  Widget build(BuildContext context) {
    void _showQRCode(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SCAN DISINI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/image/qr.jpg',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text("Minta Uang",
              style: TextStyle(fontSize: 18, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 117, 0, 0),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: 100,
                color: Color.fromARGB(255, 117, 0, 0),
              ),
              Positioned(
                top: 15,
                left: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400]!,
                    ),
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minta Cepat",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Cari Nama atau Nomor Telepon",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                            ),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 4,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                          ),
                          itemCount: profileImage.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () async {
                                final int? nominal = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RequestMoneyTransaction(
                                      name: names[index],
                                      profileImage: profileImage[index],
                                      saldo: saldo,
                                    ),
                                  ),
                                );

                                if (nominal != null && nominal > 0) {
                                  Navigator.pop(context, nominal);
                                }
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(profileImage[index]),
                                          fit: BoxFit.contain,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(names[index])
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 360,
                left: 20,
                child: InkWell(
                  onTap: () {
                    _showQRCode(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400]!,
                      ),
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Minta uang secara langsung pakai",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Image.asset(
                            'assets/image/qr_logo.png',
                            width: 50,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
