import 'package:dependency_injection_demo/api_provider/quote_api_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuoteRepository {
  final String _env;
  const QuoteRepository(
      {@Named("prod") QuoteApiProvider? provider, @factoryParam env})
      : _env = env,
        _provider = provider ?? const MockQuoteApiProvider();

  final QuoteApiProvider _provider;
  Future<List> getQuotes() {
    return _provider.getQuotes(_env);
  }
}
