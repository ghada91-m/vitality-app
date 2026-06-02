import 'package:flutter/material.dart';

import '../../../core/services/progress_service.dart';
import '../../features/progress/models/progress_model.dart';
class ProgressProvider
    extends ChangeNotifier {

  ProgressModel? progress;

  bool isLoading = false;

  Future<void> loadProgress() async {

    isLoading = true;
    notifyListeners();

    progress =
    await ProgressService.getProgress();

    isLoading = false;
    notifyListeners();
  }
}