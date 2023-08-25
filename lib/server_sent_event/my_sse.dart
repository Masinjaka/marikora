// ignore_for_file: file_names

import 'package:flutter_client_sse/flutter_client_sse.dart';

class MySse {
  late Stream<SSEModel> sseStream;

  // Getter
  Stream<SSEModel> get stream => sseStream;

  void sseSubscriber() {
    sseStream = SSEClient.subscribeToSSE(
        url: 'http://smartora-reader.local:1234/events',
        header: {
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        });
  }
}
