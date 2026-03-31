import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';

import '../../../../../core/network/text_constant.dart';

abstract class SurahLocalDataSource {
  List<SurahEntity> getAllSurahs();
} 

class SurahLocalDataSourceImpl implements SurahLocalDataSource {
  @override
  List<SurahEntity> getAllSurahs() {
    var box = Hive.box<SurahEntity>(TextConstant.kFeaturedsurahBox);
    return box.values.toList();
  }
}