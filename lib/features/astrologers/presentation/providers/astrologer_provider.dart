import 'package:astrosagga_assignment/features/astrologers/data/models/astrologer_model.dart';
import 'package:astrosagga_assignment/features/astrologers/data/repositories/astrologer_repository_impl.dart';
import 'package:astrosagga_assignment/features/astrologers/domain/repositories/astrologer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

// Provider to get the Hive box
final astrologerBoxProvider = Provider<Box<AstrologerModel>>((ref) {
  return Hive.box<AstrologerModel>('astrologers');
});

// Provider to get the repository instance
final astrologerRepositoryProvider = Provider<AstrologerRepository>((ref) {
  final box = ref.watch(astrologerBoxProvider);
  return AstrologerRepositoryImpl(box);
});

// Provider to get all astrologers
final astrologersProvider = Provider<List<AstrologerModel>>((ref) {
  final repository = ref.watch(astrologerRepositoryProvider);
  return repository.getAllAstrologers();
});

// Provider to get a specific astrologer by ID
final astrologerDetailProvider = FutureProvider.family<AstrologerModel, String>(
      (ref, id) async {
    final repository = ref.watch(astrologerRepositoryProvider);
    final astrologer = repository.getAstrologerById(id);
    if (astrologer != null) {
      return astrologer;
    } else {
      throw Exception('Astrologer not found');
    }
  },
);
