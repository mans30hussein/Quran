  import 'package:hive/hive.dart';

import '../../../features/quran_fehres/domain/entity/surah_entity.dart';
import '../../network/text_constant.dart';

Future<void> saveSurahDate(List<SurahEntity> surahs) async {
    var box = await Hive.openBox(TextConstant.kFeaturedsurahBox);
    box.addAll(surahs);
  }