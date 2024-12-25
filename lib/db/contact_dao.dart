
import 'package:contact_app/models/Contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao{

  @insert
  Future<void> insertContact(Contact contact);

  @Query("Select * from Contact")
  Stream<List<Contact>> getAllContact();

}