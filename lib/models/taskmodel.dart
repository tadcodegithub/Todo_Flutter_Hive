import 'package:hive/hive.dart';

part 'taskmodel.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  //@HiveField(0, defaultValue: 0)
  //final int? taskId;
  @HiveField(1)
  final String? taskTitle;
  @HiveField(2)
  final String? taskDiscription;
  @HiveField(3)
  final String? currentStatus;
  @HiveField(4)
  final DateTime? startDate;
  @HiveField(5)
  final DateTime? endDate;
  TaskModel({
    // required this.taskId,
    required this.taskTitle,
    required this.taskDiscription,
    required this.currentStatus,
    required this.startDate,
    required this.endDate,
  });
}
