import 'package:dependency_injection_demo/model/quote.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../repository/quote_repository.dart';

class MyQuotePage extends StatefulWidget {
  const MyQuotePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyQuotePageState createState() => _MyQuotePageState();
}

class _MyQuotePageState extends State<MyQuotePage> {
  late QuoteRepository _quoteRepository;
  late Future<List> _futureQuote;

  @override
  void initState() {
    super.initState();
    _quoteRepository = GetIt.instance.get<QuoteRepository>(param1: "testing");
    _futureQuote = _quoteRepository.getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List>(
            future: _futureQuote,
            builder: (context, AsyncSnapshot<List> snapData) {
              if (snapData.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapData.hasError) {
                  return Center(child: Text('Error: ${snapData.error}'));
                } else {
                  return ListView.builder(
                      itemCount: snapData.data?.length,
                      itemBuilder: (context, index) {
                        return _quoteItem(snapData.data![index], index);
                      });
                }
              }
            }),
      ),
    );
  }

  Widget _quoteItem(Quote item, index) {
    return ListTile(
      tileColor: index % 2 == 0 ? Colors.white : Colors.grey.withOpacity(0.1),
      title: Text(
        '${item.quote}',
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('- ${item.author}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
      ),
    );
  }
}
