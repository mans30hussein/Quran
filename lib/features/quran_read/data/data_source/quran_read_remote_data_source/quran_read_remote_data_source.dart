  import 'package:flutter/material.dart';

  import '../../../../../core/network/api_client.dart';
  import '../model/quran_model.dart';

  class QuranReadRemoteDataSource {
    final ApiClient _apiClient;
    QuranReadRemoteDataSource(this._apiClient);

    Future<QuranModel> getQuran() async {
      final response = await _apiClient.get(urlEndPoint: "quran");
     // debugPrint(response.data.toString());
      return QuranModel.fromJson(response.data);
    }

    Future<QuranSurahModel> getSurahByNumber(int number) async {
      final response = await _apiClient.get(urlEndPoint: "surah/$number");
     // debugPrint(response.data.toString());
      return QuranSurahModel.fromJson(response.data['data']['surahs']);
    }
  }