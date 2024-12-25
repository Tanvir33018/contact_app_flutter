import 'package:contact_app/models/Contact.dart';
import 'package:contact_app/pages/details_page.dart';
import 'package:contact_app/pages/new_contact_page.dart';
import 'package:contact_app/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final contactModel = Provider.of<ContactProvider>(context);
    //List<Contact> contactList = contactModel.getContact() as List<Contact>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: FutureBuilder<Stream<List<Contact>>?>(
          future: contactModel.getContact(),
          builder: (context, futureSnapshot){
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Show loading while waiting
            } else if (futureSnapshot.hasError) {
              return Center(child: Text('Error: ${futureSnapshot.error}')); // Handle errors
            } else if (!futureSnapshot.hasData || futureSnapshot.data == null) {
              return const Center(child: Text('No data available')); // Handle null/empty data
            }else{
              final objectStream = futureSnapshot.data!;

              return StreamBuilder<List<Object>>(
                stream: objectStream,
                builder: (context, streamSnapshot) {
                  if (streamSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // Show loading while waiting
                  } else if (streamSnapshot.hasError) {
                    return Center(child: Text('Error: ${streamSnapshot.error}')); // Handle errors
                  } else if (!streamSnapshot.hasData || streamSnapshot.data!.isEmpty) {
                    return const Center(child: Text('No objects found')); // Handle empty list
                  } else {
                    final objects = streamSnapshot.data!;
                    return ListView.separated(
                      itemCount: objects.length,
                      itemBuilder: (context, index) {
                        final object = objects[index] as Contact;
                        return GestureDetector(
                          onTap: () {
                            print('Clicked on ${object.name}');
                            Navigator.pushNamed(context, DetailsPage.routeName, arguments: {object});
                          },
                          child: ListTile(
                            title: Text(object.name), // Replace with object properties
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ); // Divider between items
                      },
                    );
                  }
                },
              );
            }
          }
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, NewContactPage.routeName),
        child: const SizedBox(
          width: 30,
          height: 30,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
