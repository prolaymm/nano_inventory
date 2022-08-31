// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductVoAdapter extends TypeAdapter<ProductVo> {
  @override
  final int typeId = 1;

  @override
  ProductVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVo(
      addBy: fields[0] as String?,
      createdTime: fields[2] as String?,
      description: fields[3] as String?,
      alertCount: fields[4] as int?,
      brand: fields[5] as String?,
      category: fields[6] as String?,
      code: fields[7] as String?,
      itemName: fields[8] as String?,
      office: fields[9] as String?,
      qty: fields[10] as int?,
      id: fields[1] as String?,
      history: (fields[11] as List?)?.cast<History>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductVo obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.addBy)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.createdTime)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.alertCount)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.code)
      ..writeByte(8)
      ..write(obj.itemName)
      ..writeByte(9)
      ..write(obj.office)
      ..writeByte(10)
      ..write(obj.qty)
      ..writeByte(11)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 2;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      editBy: fields[0] as String?,
      qty: fields[1] as int?,
      editDate: fields[2] as String?,
      total: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.editBy)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.editDate)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
