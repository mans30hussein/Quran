import 'package:flutter/material.dart';
import 'package:quran_app/core/network/api_client.dart';
import 'package:quran_app/feature/quran_fehres/data/model/surah_model/surah_model.dart';

class SurahApiDataSource {
  final ApiClient _apiClient;
  SurahApiDataSource(this._apiClient);

  Future<SurahModel> getAllSurahs() async {
    final response = await _apiClient.get(urlEndPoint: "surah");
    debugPrint(response.data.toString());
    return SurahModel.fromJson(response.data); // as Map<String, dynamic>
  }
}
