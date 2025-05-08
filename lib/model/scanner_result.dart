import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class ScannerResult extends HiveObject {
  @HiveField(0)
  final String result;

  ScannerResult({required this.result});
}
