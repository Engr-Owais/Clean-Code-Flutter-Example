import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/state_bloc.dart';
import '../blocs/state_event.dart';
import '../blocs/state_state.dart';
import '../../domain/entities/state_entity.dart';

class DetailPage extends StatelessWidget {
  final String stateName;

  const DetailPage({super.key, required this.stateName});

  @override
  Widget build(BuildContext context) {
    context.read<StateBloc>().add(FetchStateDetail(stateName));

    return Scaffold(
      appBar: AppBar(
        title: Text(stateName),
      ),
      body: BlocBuilder<StateBloc, StateState>(
        builder: (context, state) {
          if (state is StateLoading) {
            return const Center(child: const CircularProgressIndicator());
          } else if (state is StateDetailLoaded) {
            final StateEntity stateDetail = state.stateDetail;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    stateDetail.name,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  Text('Capital: ${stateDetail.capital}',
                      style: const TextStyle(fontSize: 18.0)),
                  const SizedBox(height: 8.0),
                  Text('Population: ${stateDetail.population}',
                      style: const TextStyle(fontSize: 18.0)),
                ],
              ),
            );
          } else if (state is StateError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
