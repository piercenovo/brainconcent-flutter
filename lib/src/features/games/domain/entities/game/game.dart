import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final String name;
  final String category;
  final String image;
  final String link;
  final String description;
  final List<String> skillsTitles;
  final List<String> skillsImages;
  final String? uid;

  const Game({
    required this.name,
    required this.category,
    required this.image,
    required this.link,
    required this.description,
    required this.skillsTitles,
    required this.skillsImages,
    this.uid,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        image,
        link,
        description,
        skillsTitles,
        skillsImages,
        uid
      ];
}
