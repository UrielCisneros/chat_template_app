import 'package:chat_template_app/domain/entities/message.dart';
import 'package:chat_template_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesAndNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromJsonModel(response.data);
    return yesNoModel.toMessageEntity();
  }
}
