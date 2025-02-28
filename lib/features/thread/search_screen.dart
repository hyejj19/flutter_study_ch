import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchTerm = "";
  final TextEditingController _controller = TextEditingController();

  Future<List<Map<String, dynamic>>> fetchPosts(String searchTerm) async {
    QuerySnapshot querySnapshot;

    if (searchTerm.isEmpty) {
      querySnapshot = await FirebaseFirestore.instance.collection('post').get();
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where("title", isLessThanOrEqualTo: searchTerm + '\uf8ff')
          .get();

      print(querySnapshot);
    }

    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Search...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchPosts(searchTerm),
              builder: (context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No results found"));
                }
                return ListView(
                  children: snapshot.data!.map((post) {
                    return ListTile(
                      title: Text(post["title"]),
                      subtitle: Text(post["content"]),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
