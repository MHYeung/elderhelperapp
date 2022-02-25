import 'package:equatable/equatable.dart';

class AppNotification extends Equatable{
  final String title;
  final String? content;
  final DateTime noteTime;
  final String id;

  const AppNotification(
      {required this.id,
      required this.title,
      this.content,
      required this.noteTime});

  AppNotification copyWith(
          {String? title, String? content, DateTime? noteTime, String? id}) =>
      AppNotification(
          id: id ?? this.id,
          title: title ?? this.title,
          noteTime: noteTime ?? this.noteTime,
          content: content ?? this.content);

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
        id: json['id'],
        title: json['title'],
        noteTime: DateTime.parse(json['noteTime']),
        content: json['content']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'noteTime': noteTime.toIso8601String(), 'content': content};

  @override
  List<Object?> get props => [id, title, noteTime, content];
}
