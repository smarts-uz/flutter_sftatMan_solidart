import 'package:equatable/equatable.dart';
import 'package:flutter_solidart_testapp/githubserch/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_item.g.dart';

@JsonSerializable(createToJson: false)
class SearchResultItem extends Equatable {
  const SearchResultItem({
    required this.fullName,
    required this.htmlUrl,
    required this.owner,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);

  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final GithubUser owner;

  @override
  List<Object?> get props => [fullName, htmlUrl, owner];
}
