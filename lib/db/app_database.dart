
import 'package:floor/floor.dart';

import '../models/Contact.dart';
import 'contact_dao.dart';
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';



@Database(version: 1, entities: [Contact])
abstract class AppDatabase extends FloorDatabase{
   ContactDao get contactDao;
}