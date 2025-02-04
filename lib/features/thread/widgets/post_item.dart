import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String author;
  final String content;
  final int replies;
  final int likes;
  final List<String> imageUrls;

  const PostItem({
    super.key,
    required this.author,
    required this.content,
    required this.replies,
    required this.likes,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                content,
                style: TextStyle(fontSize: 14),
              ),
              if (imageUrls.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imageUrls.map((imageUrl) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            width: 320,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              Row(
                children: [
                  Row(
                    children: [Text('$replies'), Text('replies')],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [Text('$likes'), Text('likes')],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
