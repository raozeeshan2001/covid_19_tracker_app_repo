import 'package:covid_tracker_app/Services/Utilities/world_states_api.dart';
import 'package:covid_tracker_app/view/detail_screen.dart';
import 'package:covid_tracker_app/view/world_states.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WorldStatesapi worldStatesapi = WorldStatesapi();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: textcontroller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: worldStatesapi.FetchCountriesList(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return Text('loading');
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (textcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    countryname:
                                                        snapshot.data![index]
                                                            ['country'],
                                                    image: snapshot.data![index]
                                                            ['countryInfo']
                                                            ['flag']
                                                        .toString(),
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    totalrecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totaldeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayrecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  )
                                ],
                              );
                            } else if (name
                                .toLowerCase()
                                .contains(textcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    countryname:
                                                        snapshot.data![index]
                                                            ['country'],
                                                    image: snapshot.data![index]
                                                            ['countryInfo']
                                                            ['flag']
                                                        .toString(),
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    totalrecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    totaldeaths: snapshot
                                                        .data![index]['deaths'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    todayrecovered:
                                                        snapshot.data![index]
                                                            ['todayRecovered'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      )),
    );
  }
}
