import 'dart:async';
import 'package:flutter/foundation.dart';

class RefreshListenable extends ChangeNotifier {
  late final StreamSubscription _subscription;

  RefreshListenable(Stream stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
