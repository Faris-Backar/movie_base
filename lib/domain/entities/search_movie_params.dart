import 'package:equatable/equatable.dart';

class SearchMovieParams extends Equatable {
  final String searchTerm;
  const SearchMovieParams({
    required this.searchTerm,
  });

  @override
  List<Object?> get props => [searchTerm];
}
