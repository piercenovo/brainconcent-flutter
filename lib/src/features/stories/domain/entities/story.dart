// import 'package:equatable/equatable.dart';

// class Story extends Equatable {
//   final String name;
//   final String description;
//   final String image;
//   final String duration;
//   final String uid;

//   const Story({
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.duration,
//     required this.uid,
//   });

//   @override
//   List<Object?> get props => [
//         name,
//         description,
//         image,
//         duration,
//         uid,
//       ];
// }

import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String name;
  final String description;
  final String image;
  final String duration;
  final List<String> chapterTitles;
  final List<String> chapterDuration;
  final List<String> chapterVideos;
  final String uid;

  const Story({
    required this.name,
    required this.description,
    required this.image,
    required this.duration,
    required this.chapterTitles,
    required this.chapterDuration,
    required this.chapterVideos,
    required this.uid,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        image,
        duration,
        chapterTitles,
        chapterDuration,
        chapterVideos,
        uid,
      ];
}
