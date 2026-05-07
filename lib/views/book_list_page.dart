import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/book.dart';

class BookListPage extends StatelessWidget {
  final BookSortType sortType;

  const BookListPage({super.key, required this.sortType});

  @override
  Widget build(BuildContext context) {
    final sortedBooks = [...books];

    if (sortType == BookSortType.author) {
      sortedBooks.sort((a, b) => a.author.compareTo(b.author));
    } else {
      sortedBooks.sort((a, b) => a.title.compareTo(b.title));
    }

    final heading = sortType == BookSortType.author
        ? 'Sorted by Author'
        : 'Sorted by Title';

    final detailRoute = sortType == BookSortType.author
        ? 'byAuthorDetail'
        : 'byTitleDetail';

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Books'),
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
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: sortedBooks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final book = sortedBooks[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(2),
                    onTap: () {
                      context.goNamed(detailRoute, extra: book);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFFDF5FF)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book.author,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
