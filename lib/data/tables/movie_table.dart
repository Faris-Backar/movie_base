import 'package:hive/hive.dart';
import 'package:movie_base/domain/entities/movie_entities.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntities {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  MovieTable(this.id, this.title, this.posterPath) : super();
}
