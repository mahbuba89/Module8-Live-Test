import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

// Landing Route
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: themes(),
    initialRoute: RouteName.homePage,
    routes: routes,
  );
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<UserList> userList = [
    UserList(
        names: 'Abir', email: 'abir80503@gmail.com', phoneNumber: 01722734871),
    UserList(
        names: 'Sabbir', email: 'sabbir@gmail.com', phoneNumber: 01644081493),
    UserList(
        names: 'Ripon', email: 'ripon2@gmail.com', phoneNumber: 01815181972),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Name : ${userList[index].names}',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Email : ${userList[index].email}',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Phone Number : ${userList[index].phoneNumber}',
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            );
          },
          title: Text(
            userList[index].names,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ));
}
class UserList {
  final String names;
  final String email;
  final int phoneNumber;
  UserList({
    required this.names,
    required this.email,
    required this.phoneNumber,
  });
}
class RouteName {
  static const homePage = '/HomePage';
}
Map<String, WidgetBuilder> get routes => {
  RouteName.homePage: (context) => HomePage(),
};
ThemeData themes() => ThemeData(
    floatingActionButtonTheme:
    const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple)),
    appBarTheme:
    const AppBarTheme(centerTitle: true, backgroundColor: Colors.green));
