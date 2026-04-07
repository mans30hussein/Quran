import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../data/repo_impl/quran_read_repo_impl.dart';
import '../maneger/cubit/quran_read_cubit.dart';
import '../maneger/cubit/quran_read_state.dart';



class QuranTestScreen extends StatelessWidget {
  const QuranTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran API Test'),
      ),
      body: BlocProvider<QuranCubit>(
        create: (context) => QuranCubit( 
          repository: getIt<QuranReadRepoImpl>(),
          
        )..getQuran(),
        child: BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (state is QuranLoaded) {
              return ListView.builder(
                itemCount: state.quran.surahs.length,
                itemBuilder: (context, index) {
                  final surah = state.quran.surahs[index];
        
                  return ListTile(
                    title: Text(surah.name),
                    subtitle: Text("Ayahs: ${surah.ayahs.length}"),
                  );
                },
              );
            }
        
            if (state is QuranError) {
              return Center(
                child: Text(state.message),
              );
            }
        
            return const Center(
              child: Text("Press button to load data"),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<QuranCubit>().getQuran();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}