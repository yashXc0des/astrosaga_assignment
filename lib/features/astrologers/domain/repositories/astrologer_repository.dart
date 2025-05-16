import '../../data/models/astrologer_model.dart';

abstract class AstrologerRepository {
  List<AstrologerModel> getAllAstrologers();
  AstrologerModel? getAstrologerById(String id);
}
