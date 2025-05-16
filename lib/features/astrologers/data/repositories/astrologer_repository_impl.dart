import 'package:astrosagga_assignment/features/astrologers/data/models/astrologer_model.dart';
import 'package:astrosagga_assignment/features/astrologers/domain/repositories/astrologer_repository.dart';
import 'package:hive_flutter/adapters.dart';

class AstrologerRepositoryImpl implements AstrologerRepository {
  final Box<AstrologerModel> _astrologersBox;

  AstrologerRepositoryImpl(this._astrologersBox);

  @override
  List<AstrologerModel> getAllAstrologers() {
    return _astrologersBox.values.toList();
  }

  @override
  AstrologerModel? getAstrologerById(String id) {
    try {
      return _astrologersBox.values.firstWhere(
            (astrologer) => astrologer.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}