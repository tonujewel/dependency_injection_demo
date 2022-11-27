// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      quote: json['quote'] as String?,
      author: json['author'] as String?,
      lang: json['lang'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'quote': instance.quote,
      'author': instance.author,
      'lang': instance.lang,
      'tags': instance.tags,
    };

QuoteList _$QuoteListFromJson(Map<String, dynamic> json) => QuoteList(
      quotes: (json['quotes'] as List<dynamic>?)
          ?.map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteListToJson(QuoteList instance) => <String, dynamic>{
      'quotes': instance.quotes,
    };
