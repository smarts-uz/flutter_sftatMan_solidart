import 'package:equatable/equatable.dart';
import 'package:flutter_solidart_testapp/githubserch/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable(createToJson: false)
class SearchResult extends Equatable {
  const SearchResult({required this.items});

  factory SearchResult.empty() => const SearchResult(items: []);

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  final List<SearchResultItem> items;

  @override
  List<Object?> get props => [items];
}
