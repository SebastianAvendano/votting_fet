import 'package:votting/core/providers/disposable_provider.dart';
import 'package:votting/data/models/election/election_model.dart';

class ElectionProvider extends DisposableProvider {
  ElectionModel _election = const ElectionModel();

  ElectionModel get election => _election;

  set election(ElectionModel election) {
    _election = election;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _election = const ElectionModel();
  }
}
