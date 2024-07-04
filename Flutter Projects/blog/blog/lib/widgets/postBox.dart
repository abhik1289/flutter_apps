import 'package:flutter/material.dart';

class PostBox extends StatelessWidget {
  final String imageSrc;
  final ImageProvider profileImageSrc;
  final VoidCallback onTap;
  final String title;
  final String date;
  final Widget right;

  const PostBox(
      {Key? key,
       required this.onTap,
      required this.imageSrc,
      required this.date,
      required this.title,
      required this.right,
      required this.profileImageSrc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Column(
          children: [
            Image.asset(
              imageSrc,
              fit: BoxFit.cover,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: profileImageSrc,
                    radius: 30.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.subtitle1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(date),
                        )
                      ],
                    ),
                    width: (MediaQuery.of(context).size.width) - 130,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  right
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
