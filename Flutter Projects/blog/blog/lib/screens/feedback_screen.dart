import 'package:flutter/material.dart';

class Feedbacks extends StatefulWidget {
  Feedbacks({Key? key}) : super(key: key);

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  final TextEditingController nameTextController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameTextController.text = "Abhik Patra";
  }

  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameTextController,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  maxLength: 400,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    
                    hintText: "Describtion"),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: theme.primaryColor),
                      onPressed: (){}, child: Text("Send Report",style:theme.textTheme.headline6 ,))))
              ],
            ))
          ],
        ),
      )),
      appBar: AppBar(
        title: const Text("Give Feedbacks"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
