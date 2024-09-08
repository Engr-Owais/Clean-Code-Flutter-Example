import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/state_entity.dart';
import '../blocs/state_bloc.dart';

import '../blocs/state_event.dart';
import '../blocs/state_state.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StateEntity>? cachedStates;

  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch states when the page is first loaded
    context.read<StateBloc>().add(FetchStates());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Malaysian States'),
      ),
      body: BlocConsumer<StateBloc, StateState>(
        listener: (context, state) {
          if (state is StateLoaded) {
            cachedStates = state.states; // Cache the states when loaded
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (StateLoading):
              return const Center(child: CircularProgressIndicator());

            case const (StateLoaded):
              cachedStates =
                  (state as StateLoaded).states; // Cache the states when loaded
              return _buildStateList(cachedStates!);

            case const (StateError):
              return Center(
                  child: Text('Error: ${(state as StateError).message}'));

            default:
              if (cachedStates != null) {
                // Show cached data when navigating back
                return _buildStateList(cachedStates!);
              } else {
                return const Center(
                    child: Text('No data available')); // Default fallback
              }
          }
        },
      ),
    );
  }

  Widget _buildStateList(List<StateEntity> states) {
    return ListView.builder(
      itemCount: states.length,
      itemBuilder: (context, index) {
        final stateItem = states[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.green.shade300,
            title: Text(stateItem.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(stateName: stateItem.name),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
