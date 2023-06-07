import 'package:flutter/material.dart';

class EditContactPage extends StatefulWidget {
  final String name;
  final String phone;
  final String email;

  const EditContactPage({super.key,
    required this.name,
    required this.phone,
    required this.email,
  });

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _phone;
  late String _email;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _phone = widget.phone;
    _email = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC600),
        title: const Text('Kişi Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir isim girin.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Telefon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir telefon numarası girin.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'E-posta'),
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFFC600),
                ),
                onPressed: _saveContact,
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Kişi verileri burada kaydedilebilir.

      Navigator.pop(context);
    }
  }
}
