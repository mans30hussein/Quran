import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_app/features/quran_fehres/domain/entity/surah_entity.dart';

import '../../../../../core/network/text_constant.dart';

abstract class SurahLocalDataSource {
  List<SurahEntity> getAllSurahs();
  Future<void> saveSurahs(List<SurahEntity> surahs);
}

class SurahLocalDataSourceImpl implements SurahLocalDataSource {
  @override
  List<SurahEntity> getAllSurahs() {
    var box = Hive.box<SurahEntity>(TextConstant.kFeaturedsurahBox);
    final surahs = box.values.toList();
    print("Fetched ${surahs.length} surahs from local storage");
    return surahs;
  }

  @override
  Future<void> saveSurahs(List<SurahEntity> surahs) async {
    var box = Hive.box<SurahEntity>(TextConstant.kFeaturedsurahBox);
    print("Saving ${surahs.length} surahs to local storage");
    await box.clear();
    await box.addAll(surahs);
    print("Saved ${box.length} surahs to local storage");
  }
}
