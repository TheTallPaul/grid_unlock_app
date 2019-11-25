import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/screens/networks/networks.dart';
import 'package:grid_unlock/widgets/widgets.dart';
import 'package:networks_repository/networks_repository.dart';

class NetworksHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Networks'),
        ),
        drawer: NavigationDrawer(),
        body:
            BlocBuilder<NetworksBloc, NetworksState>(builder: (context, state) {
          if (state is NetworksLoading) {
            return LoadingIndicator();
          }
          if (state is NetworksLoaded && state.networks.isEmpty) {
            return NetworksStartScreen();
          }
          if (state is NetworksLoaded && state.networks.isNotEmpty) {
            final networks = state.networks;
            return ListView.builder(
              itemCount: networks.length,
              itemBuilder: (context, index) {
                final network = networks[index];

                return NetworkItem(
                  network: network,
                  onTap: () {},
                );
              },
            );
          }
          return LoadingIndicator();
        }));
  }
}

class NetworkItem extends StatelessWidget {
  const NetworkItem({
    @required this.onTap,
    @required this.network,
    Key key,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final Network network;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Hero(
        tag: '${network.id}__heroTag',
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            network.name,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      subtitle: network.description.isNotEmpty
          ? Text(
              network.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subhead,
            )
          : null,
    );
  }
}
