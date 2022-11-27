import 'package:injectable/injectable.dart';
import '../model/quote.dart';

abstract class QuoteApiProvider {
  const QuoteApiProvider();
  Future<List<Quote>> getQuotes(String quote);
}

@Singleton(as: QuoteApiProvider)
class MockQuoteApiProvider implements QuoteApiProvider {
  const MockQuoteApiProvider();

  @override
  Future<List<Quote>> getQuotes(String quote) async {
    //add some delay to give the feel of api call
    await Future.delayed(const Duration(seconds: 3));
    return Future.value([
      const Quote(
          quote: "Simplicity is a great virtue.",
          author: "Edsger Wybe Dijkstra"),
      const Quote(
          quote: "Progress and don't look back.", author: "Michael Nielsen")
    ]);
  }
}

@Named("prod")
@Singleton(as: QuoteApiProvider)
class RealQuoteApiProvider implements QuoteApiProvider {
  @override
  Future<List<Quote>> getQuotes(String quote) async {
    await Future.delayed(const Duration(seconds: 3));

    return Future.value([
      const Quote(
        quote: "Simplicity is a great virtue from production.",
        author: "Edsger Wybe Dijkstra",
      ),
      const Quote(
        quote: "Progress and don't look back.",
        author: "Michael Nielsen",
      )
    ]);
  }
}
