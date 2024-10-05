import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestMoneyTransaction extends StatefulWidget {
  final String name;
  final String profileImage;
  final double saldo;

  RequestMoneyTransaction({
    required this.name,
    required this.profileImage,
    required this.saldo,
  });

  @override
  _RequestMoneyTransactionState createState() =>
      _RequestMoneyTransactionState();
}

class _RequestMoneyTransactionState extends State<RequestMoneyTransaction> {
  bool isChecked = false;
  TextEditingController _controller = TextEditingController();
  int? nominalTransfer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      String text = _controller.text.replaceAll(RegExp(r'[^0-9]'), '');
      if (text.isNotEmpty) {
        // Format angka dengan separator ribuan
        String formattedText = NumberFormat.currency(
          locale: 'id',
          symbol: 'Rp',
          decimalDigits: 0,
        ).format(int.parse(text));

        _controller.value = _controller.value.copyWith(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );

        setState(() {
          nominalTransfer = int.tryParse(text);
        });
      }
    });
  }

  void _konfirmasiTransfer() {
    if (nominalTransfer == null || nominalTransfer! <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage('lib/icons/cross.png')),
              SizedBox(
                width: 8,
              ),
              Text("Nominal tidak boleh kosong"),
            ],
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text("Permintaan Berhasil dikirim")
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );

    Navigator.pop(context, nominalTransfer);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text("Minta Uang ke ${widget.name}",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromARGB(255, 117, 0, 0),
          centerTitle: true,
        ),
        body: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: 100,
                color: Color.fromARGB(255, 117, 0, 0),
              ),
              Positioned(
                top: 25,
                left: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 270,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: const Color.fromARGB(255, 83, 81, 81),
                    ),
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(widget.profileImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 225),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Masukkan Nominal",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      TextField(
                        controller: _controller,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: "Rp0",
                          hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
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
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Tulis Catatan untuk Pengirim",
                          hintStyle: TextStyle(fontSize: 13),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/image/warning.png',
                              width: 17.0,
                              height: 17.0,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Cek ulang nama pengirim dan nominal")
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                          width: 250,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 117, 0, 0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  "KONFIRMASI",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onTap: _konfirmasiTransfer,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
