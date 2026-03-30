import 'package:flutter/material.dart';
import 'package:quran_app/app_config/app_config.dart';
import 'package:quran_app/core/network/api_client.dart';
import 'package:quran_app/core/network/api_result.dart';
import 'package:quran_app/feature/quran_fehres/data/data_source/surah_api_data_source/surah_api_data_source.dart';
import 'package:quran_app/feature/quran_fehres/data/repo_impl/surah_repo_impl/surah_repo_impl.dart';
import 'package:quran_app/feature/quran_fehres/domain/entity/surah_entity.dart';
import 'package:quran_app/feature/quran_fehres/domain/repo/surah_repo.dart';

void runChatApp({required AppConfig appConfig}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiClient = await ApiClient.create();
  final surahApiDataSource = SurahApiDataSource(apiClient);
  final surahRepo = SurahRepoImpl(surahApiDataSource);

  runApp(QuranApp(surahRepo: surahRepo));
}

class QuranApp extends StatelessWidget {
  final SurahRepo surahRepo;
  const QuranApp({super.key, required this.surahRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Quran Surahs")),
        body: FutureBuilder<ApiResult<List<SurahEntity>>>(
          future: surahRepo.getAllSurahs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            final result = snapshot.data;
            if (result is Success<List<SurahEntity>>) {
              final surahs = result.data;
              return ListView.builder(
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(surahs[index].surahName ?? ""),
                    subtitle: Text("Ayahs: ${surahs[index].numberOfAyahs}"),
                    leading: CircleAvatar(
                      child: Text("${surahs[index].number}"),
                    ),
                  );
                },
              );
            } else if (result is Failure<List<SurahEntity>>) {
              return Center(child: Text("Failure: ${result.message}"));
            }

            return const Center(child: Text("No data found"));
          },
        ),
      ),
    );
  }
}
