import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading  = false;
  bool disposed = false;

  bool get isLoading => _isLoading;
  setLoading(bool val){
    _isLoading = val;
    notifyListeners();
  }

   @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

}