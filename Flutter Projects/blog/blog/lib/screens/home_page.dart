import 'package:blog/widgets/postBox.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'menu_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
        actions: [searchyBtn(), profileBtn(context)],
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            PostBox(
              onTap: ()=>Navigator.pushNamed(context, "/ReadScreen"),
              imageSrc: "asset/nature.jpg",
              date: "21/12/20",
              profileImageSrc: const AssetImage("asset/profile.jpg"),
              title: "Hello I am a good man",
              right: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  showBtmSheet(context);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  showBtmSheet(context) {
    final theme = Theme.of(context);
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (context) => Container(
              height: 260.0,
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 120.0,
                      height: 3.0,
                      color: const Color(0xffbdc3c7),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: Text(
                      "Add favourite",
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.playlist_add),
                    title: Text(
                      "Make palylist",
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: Text(
                      "Share",
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.not_interested),
                    title: Text(
                      "No interest",
                      style: theme.textTheme.subtitle1,
                    ),
                  )
                ],
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ));
  }

  searchyBtn() {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.search));
  }

  profileBtn(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop, child: MenuPage()));
      },
      child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: const CircleAvatar(
            backgroundImage: AssetImage("asset/profile.jpg"),
          )),
    );
  }
}
