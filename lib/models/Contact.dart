

import 'package:floor/floor.dart';

@entity
class Contact{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String name;
  String mobileNo;
  String address;

  Contact(this.id, this.name, this.mobileNo, this.address);
}