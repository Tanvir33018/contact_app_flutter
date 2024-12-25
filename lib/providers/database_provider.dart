
import 'package:contact_app/db/app_database.dart';
import 'package:contact_app/db/contact_dao.dart';
import 'package:flutter/cupertino.dart';

class DatabaseProvider{
  static var appDatabase;
  DatabaseProvider(){

  }
   static Future<AppDatabase> getDataBase()async{
    AppDatabase appDatabase;
    return appDatabase = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}