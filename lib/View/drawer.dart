import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  AppDrawerState createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildColumn(context);
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerHeader(
          child: Image.network(
              "https://media.licdn.com/dms/image/C4E0BAQHiV7ukshCE_A/company-logo_200_200/0/1630564495947/nydailynews_logo?e=2147483647&v=beta&t=swDZ42hbN1C9mKXF1UBWWvqyBXTXWiNM4J1vPFosG5A"),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading:
                    Icon(Icons.home, color: Theme.of(context).primaryColor),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.g_translate,
                    color: Theme.of(context).primaryColor),
                title: const Text('Languages'),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
