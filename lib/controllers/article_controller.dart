import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ufarming/models/article_model.dart';
import 'package:ufarming/services/article_service.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';

class ArticleController extends GetxController {
  final RxList articles = <Article>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      await getAllArticles().then((res) {
        if (res is List<Article>) {
          articles.addAll(res);
        } else {
          customBotToastText(res);
        }
      });
    } catch (e) {
      customBotToastText(ErrorMessage.general);
    } finally {
      isLoading.toggle();
    }
  }
}
