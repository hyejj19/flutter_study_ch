import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_ch/features/thread/widgets/post_item.dart';

class ThreadHomeScreen extends StatelessWidget {
  const ThreadHomeScreen({super.key});

  List<Map<String, dynamic>> generateMockPosts(int count) {
    return List.generate(count, (index) {
      return {
        "author": faker.person.name(),
        "content": faker.lorem.sentence(),
        "images": List.generate(
            faker.randomGenerator.integer(5, min: 1), (idx) => faker.image),
        "replies": faker.randomGenerator.integer(20),
        "likes": faker.randomGenerator.integer(100),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final posts = generateMockPosts(10);

    return Scaffold(
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
