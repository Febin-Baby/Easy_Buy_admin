import 'package:easybuy_admin_app/view/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  static const routename = '/Users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppbar(
        title: 'User Info screen',
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80',
                  ),
                ),
                title: Text('UserName'),
                subtitle: Text('Email Address'),
              ),
            );
          },
        ),
      ),
    );
  }
}
