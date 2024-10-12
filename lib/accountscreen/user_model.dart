import 'package:hive/hive.dart';


part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel extends HiveObject {
  // final String name;
  @HiveField(0)
  double balance=0;
  @HiveField(1)
  double income=0;

  UserModel( this.balance, this.income);

}