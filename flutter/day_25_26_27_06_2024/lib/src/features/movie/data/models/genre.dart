import 'package:day_25_26_06_2024/src/features/movie/domain/entities/genre.dart';

class GenreModel extends GenreEntity {
  GenreModel({
    super.image,
    super.id,
    super.name,
  });
  factory GenreModel.fromJson(json) {
    return GenreModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

final genrelist = [
  {
    "id": 28,
    "name": "Action",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3FUJT82YKY1EJ1dmunQhW5PUZAT.jpg",
  },
  {
    "id": 12,
    "name": "Adventure",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tOEOlmLP71IojeJ91dyJ9Nsb8O8.jpg",
  },
  {
    "id": 16,
    "name": "Animation",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/4nssBcQUBadCTBjrAkX46mVEKts.jpg",
  },
  {
    "id": 35,
    "name": "Comedy",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8kOWDBK6XlPUzckuHDo3wwVRFwt.jpg",
  },
  {
    "id": 80,
    "name": "Crime",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6PX0r5TRRU5y0jZ70y1OtbLYmoD.jpg",
  },
  {
    "id": 99,
    "name": "Documentary",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg",
  },
  {
    "id": 18,
    "name": "Drama",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nel144y4dIOdFFid6twN5mAX9Yd.jpg",
  },
  {
    "id": 10751,
    "name": "Family",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uwslHj6nEyPX5IbNXhuEeI0PTth.jpg",
  },
  {
    "id": 14,
    "name": "Fantasy",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg",
  },
  {
    "id": 36,
    "name": "History",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bQLrHIRNEkE3PdIWQrZHynQZazu.jpg",
  },
  {
    "id": 27,
    "name": "Horror",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7pEn2fCFWa8DIwQnxG6Cq7iaKLv.jpg",
  },
  {
    "id": 10402,
    "name": "Music",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gbmkFWdtihe1VfydTDsieQ6VfGL.jpg",
  },
  {
    "id": 9648,
    "name": "Mystery",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/o6qT33idpxWV51FsIjAyGDyp5Ou.jpg",
  },
  {
    "id": 10749,
    "name": "Romance",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9yguvvrOG8dBVIbxCst0GyzVJu1.jpg",
  },
  {
    "id": 878,
    "name": "Science Fiction",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/th5UkDLIa7yyma9UYDAWaIgDh6z.jpg",
  },
  {
    "id": 53,
    "name": "Thriller",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
  },
  {
    "id": 10752,
    "name": "War",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg",
  },
  {
    "id": 37,
    "name": "Western",
    "image":
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg",
  },
];
