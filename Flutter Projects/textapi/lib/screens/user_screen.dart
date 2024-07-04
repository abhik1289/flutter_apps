import 'package:flutter/material.dart';
import 'package:textapi/model.dart';

import 'services/remote_service.dart';

class UserScrren extends StatefulWidget {
  UserScrren({Key? key}) : super(key: key);

  @override
  State<UserScrren> createState() => _UserScrrenState();
}

class _UserScrrenState extends State<UserScrren> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Welcome>? posts;
  bool isLoaded = false;
  Future getData() async {
    posts = await RemoteService().getData();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
          return ListTile(title: Text(posts![index].title),);
        }),
        replacement: const Center(child: CircularProgressIndicator(),),
      ),
      
    );
  }
}
