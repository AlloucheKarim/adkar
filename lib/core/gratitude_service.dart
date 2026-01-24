import 'package:flutter/material.dart';

class GratitudeEntry {
  final String date;
  final String content;

  GratitudeEntry({required this.date, required this.content});

  Map<String, dynamic> toJson() => {'date': date, 'content': content};
  factory GratitudeEntry.fromJson(Map<String, dynamic> json) => GratitudeEntry(
        date: json['date'],
        content: json['content'],
      );
}

class GratitudeService extends ChangeNotifier {
  static final GratitudeService _instance = GratitudeService._internal();
  factory GratitudeService() => _instance;
  GratitudeService._internal();

  final List<GratitudeEntry> _entries = [];
  List<GratitudeEntry> get entries => List.unmodifiable(_entries);

  GratitudeEntry? get latestEntry => _entries.isEmpty ? null : _entries.last;

  void addEntry(String content) {
    final now = DateTime.now();
    final dateStr = '${now.day}/${now.month}/${now.year}';
    
    // For simplicity, we only keep one entry per day or just append
    _entries.add(GratitudeEntry(date: dateStr, content: content));
    notifyListeners();
  }
}
