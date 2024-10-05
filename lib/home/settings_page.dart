import 'package:flutter/material.dart';
import 'package:flutter_uts_1/Widgets/loginScreen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 117, 0, 0),
        automaticallyImplyLeading: false,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          const ListTile(
            leading: Icon(
              Icons.person,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Pengaturan Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.security,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Keamanan Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.link,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Sambungkan Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Verifikasi Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Smart Pay'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.help_center,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Pusat Bantuan'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.description,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Syarat & Ketentuan'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.privacy_tip,
              color: Color.fromARGB(255, 117, 0, 0),
            ),
            title: Text('Kebijakan Privasi'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 117, 0, 0),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                LogoutConfirmation(context);
              },
              child: const Text(
                'Keluar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> LogoutConfirmation(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Keluar dari Lingpay?',
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Batal',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 117, 0, 0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Oke',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 117, 0, 0),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
