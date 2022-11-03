import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String image;
  final String link;
  final String colour;
  final String ageImage;
  final String countryImage;
  final String toyImage;
  final String detailImage;
  final String story;
  final String uid;

  const Character({
    required this.name,
    required this.image,
    required this.link,
    required this.colour,
    required this.ageImage,
    required this.countryImage,
    required this.toyImage,
    required this.detailImage,
    required this.story,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        name,
        image,
        link,
        colour,
        ageImage,
        countryImage,
        toyImage,
        detailImage,
        story,
        uid,
      ];
}
