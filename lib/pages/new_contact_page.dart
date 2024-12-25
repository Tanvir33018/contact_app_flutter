import 'package:contact_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/Contact.dart';

class NewContactPage extends StatelessWidget {
  NewContactPage({super.key});

  static const String routeName = '/new_contact_page';
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    final contactModel = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            _textFiled("Name", nameController),
            _textFiled('Mobile No', mobileController),
            _textFiled('Address', addressController ),
            ElevatedButton(
                onPressed: (){
                   _submit(contactModel);
                },
                child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

   _submit(ContactProvider contactModel) async {
    String name = nameController.text;
    String mobileNo = mobileController.text;
    String address = addressController.text;

    if(name.isEmpty){
      _showToast("Enter Name");
      return;
    }

    if(mobileNo.isEmpty){
      _showToast('Enter Mobile');
      return;
    }

    if(address.isEmpty){
      _showToast("Enter Address");
      return;
    }

    Contact contact = Contact(null, name, mobileNo, address);
    contactModel.insertContact(contact);
    _showToast("Contact inserted");
  }

  _textFiled(String s, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: s
      ),
      validator: (value){
        return null;
      },
    );
  }

   _showToast(String s) {
    return Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.red,
      fontSize: 16.0,
    );
  }
}



