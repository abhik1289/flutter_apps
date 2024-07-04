import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

final List lists = [
  {Key: 1, "title": "Nature"},
  {Key: 2, "title": "Book"},
  {Key: 3, "title": "Read"},
  {Key: 4, "title": "Knowledge"}
];

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "asset/nature.jpg",
                  fit: BoxFit.cover,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        child: Icon(Icons.arrow_back),
                        backgroundColor: Colors.black12,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello I am a good man",
                    style: theme.textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English",
                    style: theme.textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tags",
                          style: theme.textTheme.headline5,
                        ),
                        Wrap(
                          children: lists
                              .map((e) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          e["title"],
                                          style: theme.textTheme.bodyText1,
                                        )),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundImage: AssetImage("asset/profile.jpg"),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abhik Patra",
                                style: theme.textTheme.headline5,
                              ),
                              Text(
                                "Author,writter",
                                style: theme.textTheme.bodyText1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 20.0),
                    width: MediaQuery.of(context).size.width - 15,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                  ))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
