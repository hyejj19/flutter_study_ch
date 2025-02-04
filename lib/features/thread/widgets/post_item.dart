import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class PostItem extends StatelessWidget {
  final String author;
  final String content;
  final int replies;
  final int likes;

  const PostItem({
    super.key,
    required this.author,
    required this.content,
    required this.replies,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite_border, color: Colors.red),
                    const SizedBox(width: 4),
                    Text('$likes'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.chat_bubble_outline),
                    const SizedBox(width: 4),
                    Text('$replies'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostListScreen extends StatelessWidget {
  final faker = Faker();

  List<Map<String, dynamic>> generateMockPosts(int count) {
    return List.generate(count, (index) {
      return {
        "author": faker.person.name(),
        "content": faker.lorem.sentence(),
        "replies": faker.randomGenerator.integer(20),
        "likes": faker.randomGenerator.integer(100),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final posts = generateMockPosts(10);

    return Scaffold(
      appBar: AppBar(title: const Text("Faker Mock Posts")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostItem(
            author: post['author'],
            content: post['content'],
            replies: post['replies'],
            likes: post['likes'],
          );
        },
      ),
    );
  }
}
