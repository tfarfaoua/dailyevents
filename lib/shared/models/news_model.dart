class NewsModel {
  final String? title;
  final String? description;
  final String? content;
  final List<dynamic>? category;
  final List<dynamic>? autor;
  final String? source;
  final String? image;
  final String? publish;

  NewsModel(
      {required this.title,
      required this.description,
      required this.content,
      required this.category,
      required this.autor,
      required this.source,
      required this.image,
      required this.publish});
}
