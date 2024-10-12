// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensemodelAdapter extends TypeAdapter<Expense_model> {
  @override
  final int typeId = 1;

  @override
  Expense_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expense_model(
      fields[2] as String,
      fields[0] as String,
      fields[1] as double,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Expense_model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
