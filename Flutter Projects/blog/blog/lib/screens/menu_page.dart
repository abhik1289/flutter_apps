

import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,leading: InkWell(
        onTap: ()=>Navigator.pop(context),
        child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),),
      body: SafeArea(
          child: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.person,
              color: Colors.white,
            )),
            title: Text(
              "View Profile",
              style: theme.textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap:() => Navigator.pushNamed(context, "/SignIn"),
            leading: const CircleAvatar(
                child: Icon(
              Icons.person_add,
              color: Colors.white,
            )),
            title: Text(
              "Add Acoount",
              style: theme.textTheme.subtitle1,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
            title: Text(
              "Favourites",
              style: theme.textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.playlist_add,
              color: Colors.white,
            )),
            title: Text(
              "Playlists",
              style: theme.textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.watch,
              color: Colors.white,
            )),
            title: Text(
              "Time Spend",
              style: theme.textTheme.subtitle1,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/Feedbacks"),
            leading: const CircleAvatar(
                child: Icon(
              Icons.feedback,
              color: Colors.white,
            )),
            title: Text(
              "Feedbacks",
              style: theme.textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.settings,
              color: Colors.white,
            )),
            title: Text(
              "Settings",
              style: theme.textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
                child: Icon(
              Icons.logout,
              color: Colors.white,
            )),
            title: Text(
              "Log Out",
              style: theme.textTheme.subtitle1,
            ),
          ),
        ],
      )),
    );
  }
}
