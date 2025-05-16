part of 'astrologer_model.dart';

class AstrologerModelAdapter extends TypeAdapter<AstrologerModel> {
  @override
  final int typeId = 0;

  @override
  AstrologerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AstrologerModel(
      id: fields[0] as String,
      name: fields[1] as String,
      profileImage: fields[2] as String,
      isOnline: fields[3] as bool,
      rating: fields[4] as double,
      experience: fields[5] as int,
      followers: fields[6] as int,
      totalCallTime: fields[7] as String,
      totalChatTime: fields[8] as String,
      profileSummary: fields[9] as String,
      specialization: fields[10] as String,
      languages: fields[11] as String,
      images: (fields[12] as List).cast<String>(),
      callRate: fields[13] as String,
      originalRate: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AstrologerModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profileImage)
      ..writeByte(3)
      ..write(obj.isOnline)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.experience)
      ..writeByte(6)
      ..write(obj.followers)
      ..writeByte(7)
      ..write(obj.totalCallTime)
      ..writeByte(8)
      ..write(obj.totalChatTime)
      ..writeByte(9)
      ..write(obj.profileSummary)
      ..writeByte(10)
      ..write(obj.specialization)
      ..writeByte(11)
      ..write(obj.languages)
      ..writeByte(12)
      ..write(obj.images)
      ..writeByte(13)
      ..write(obj.callRate)
      ..writeByte(14)
      ..write(obj.originalRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AstrologerModelAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}
