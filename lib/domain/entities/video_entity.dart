import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? title, key, type;
  const VideoEntity({
    required this.type,
    required this.title,
    required this.key,
  });

  @override
  List<Object?> get props => [title];

  @override
  bool? get stringify => true;
}
