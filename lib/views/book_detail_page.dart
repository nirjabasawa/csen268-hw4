import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book? book;

  const BookDetailPage({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('Book'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDF5FF),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed('profile');
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 36, 32, 12),
        child: Text(
          book?.description ?? 'Detail of the Book',
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
