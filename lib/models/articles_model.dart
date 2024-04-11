import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.author,
      required this.authorImageUrl,
      required this.category,
      required this.imageUrl,
      required this.views,
      required this.createdAt});

  static List<Article> articles = [
    Article(
      id: "1",
      title: "Lorem Ipsum",
      subtitle: "Lorem ipsum dolor sit amet",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      author: "John Doe",
      authorImageUrl: "https://picsum.photos/200/300",
      category: "Technology",
      imageUrl: "https://source.unsplash.com/random",
      views: 100,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: "2",
      title: "Sed ut perspiciatis",
      subtitle:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem",
      body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem. Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit",
      author: "Jane Smith",
      authorImageUrl: "https://picsum.photos/200/300",
      category: "Health",
      imageUrl: "https://source.unsplash.com/random",
      views: 150,
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),
    Article(
      id: "3",
      title: "The Importance of Exercise",
      subtitle: "Why Regular Exercise Is Vital for Your Health",
      body:
          "Regular exercise has numerous benefits for both your physical and mental health. Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit v Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit vLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      author: "Alice Johnson",
      authorImageUrl: "https://picsum.photos/200/300",
      category: "Health",
      imageUrl: "https://source.unsplash.com/random",
      views: 120,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
    Article(
      id: "4",
      title: "Introduction to Flutter Development",
      subtitle: "Getting Started with Building Apps Using Flutter",
      body:
          "Flutter is a UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit v Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      author: "Chris Brown",
      authorImageUrl: "https://picsum.photos/200/300",
      category: "Technology",
      imageUrl: "https://source.unsplash.com/random",
      views: 200,
      createdAt: DateTime.now().subtract(const Duration(hours: 15)),
    ),
    Article(
      id: "5",
      title: "The Art of Cooking",
      subtitle: "Exploring Culinary Creativity in the Kitchen",
      body:
          "Cooking is not just about preparing food; it's an art form that allows you to express creativity. Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      author: "Emily Davis",
      authorImageUrl: "https://picsum.photos/200/300",
      category: "Food",
      imageUrl: "https://source.unsplash.com/random",
      views: 180,
      createdAt: DateTime.now().subtract(const Duration(hours: 20)),
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt
      ];
}
