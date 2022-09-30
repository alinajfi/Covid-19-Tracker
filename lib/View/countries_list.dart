import 'package:covid_tracker/Services/stats_sevices.dart';
import 'package:covid_tracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  StatsServices services = StatsServices();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Search With Country Name',
                        focusColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        // fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                flex: 26,
                child: FutureBuilder(
                  future: services.fetchCountreisStats(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name =
                              snapshot.data![index]['country'].toString();

                          if (searchController.text.isEmpty) {
                            return ListTile(
                              title: Text(
                                  snapshot.data![index]['country'].toString()),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                              leading: Container(
                                height: 50,
                                width: 50,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    shape: BoxShape.circle),
                                child: Image(
                                    fit: BoxFit.fill,
                                    height: height * 0.09,
                                    width: width * 0.09,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag'])),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DetailScreen(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecoverd: snapshot.data![index]
                                          ['todayRecovered'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalCase: snapshot.data![index]['cases'],
                                      name: snapshot.data![index]['country'],
                                      test: snapshot.data![index]['tests'],
                                    );
                                  },
                                ));
                              },
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return ListTile(
                              title: Text(
                                  snapshot.data![index]['country'].toString()),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                  height: height * 0.09,
                                  width: width * 0.09,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DetailScreen(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecoverd: snapshot.data![index]
                                          ['todayRecovered'],
                                      totalRecoverd: snapshot.data![index]
                                          ['recovered'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalCase: snapshot.data![index]['cases'],
                                      name: snapshot.data![index]['country'],
                                      test: snapshot.data![index]['tests'],
                                    );
                                  },
                                ));
                              },
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.white,
                              child: ListTile(
                                title: Container(
                                  height: height * 0.02,
                                  width: width * 0.8,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: height * 0.02,
                                  width: width * 0.8,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: height * 0.09,
                                  width: width * 0.09,
                                  color: Colors.white,
                                ),
                              ));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
