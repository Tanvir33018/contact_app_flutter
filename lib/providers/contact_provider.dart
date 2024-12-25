
import 'dart:math';

import 'package:contact_app/db/contact_dao.dart';
import 'package:contact_app/providers/database_provider.dart';
import 'package:flutter/material.dart';

import '../db/app_database.dart';
import '../models/Contact.dart';

class ContactProvider with ChangeNotifier{

  DatabaseProvider databaseProvider = DatabaseProvider();



  Future<void> insertContact(Contact contact)async {

    final appDatabase = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final contactDao = appDatabase.contactDao;
    if(appDatabase == null){
      print('Database instance is null');
    }
    if(contactDao == null){
      print('Contact is Null');
    }else{
      print('Contact is not null');
      contactDao?.insertContact(contact);
    }

  }
  Future<Stream<List<Contact>>?> getContact() async {
    final appDatabase = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final contactDao = appDatabase.contactDao;
    return contactDao?.getAllContact();
  }
}

