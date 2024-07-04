import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final urlImages = [
    "https://images.unsplash.com/5/unsplash-kitsune-4.jpg?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bc01c83c3da0425e9baa6c7a9204af81",
    "https://images.unsplash.com/photo-1650530011113-ec04dddefb63?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1590076756818-c3df95e2dad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
    "https://images.unsplash.com/photo-1649859396073-13ff3244ec1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1650614967067-ae4e5948a0e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: openGallery,
          child: Ink.image(
            image: NetworkImage(urlImages[2]),
            height: 300.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void openGallery() => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => GaleryWidget(urlImages: urlImages, index: 2)));
}

class GaleryWidget extends StatefulWidget {
  final List<String> urlImages;
  final int index;
  final PageController pageController;

  GaleryWidget({required this.urlImages, this.index = 0})
      : pageController = PageController(initialPage: index);

  @override
  State<GaleryWidget> createState() => _GaleryWidgetState();
}

class _GaleryWidgetState extends State<GaleryWidget> {
  late int index = widget.index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PhotoViewGallery.builder(
              onPageChanged: (index) => setState(() {
                    this.index = index;
                  }),
              pageController: widget.pageController,
              scrollDirection: Axis.vertical,
              itemCount: widget.urlImages.length,
              builder: (context, index) {
                final urlImage = widget.urlImages[index];
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(urlImage),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 4);
              }),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Images ${index + 1}/${widget.urlImages.length}",
              style:const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
