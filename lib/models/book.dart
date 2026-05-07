enum BookSortType { author, title }

class Book {
  final String title;
  final String author;
  final String description;

  const Book({
    required this.title,
    required this.author,
    required this.description,
  });
}

const List<Book> books = [
  Book(
    title: 'Da Vinci Code',
    author: 'Dan Brown',
    description: 'Detail of the Book',
  ),
  Book(
    title: 'Da Vinci Code',
    author: 'Dan Brown',
    description: 'Detail of the Book',
  ),
  Book(
    title: 'Da Vinci Code',
    author: 'Dan Brown',
    description: 'Detail of the Book',
  ),
  Book(
    title: 'Da Vinci Code',
    author: 'Dan Brown',
    description: 'Detail of the Book',
  ),
];
