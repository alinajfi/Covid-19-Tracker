import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_tracker/Clippers/containerclipper.dart';
import 'package:covid_tracker/Models/world_report.dart';
import 'package:covid_tracker/Services/stats_sevices.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  static String screenName = 'World stats';

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> {
  StatsServices statsServices = StatsServices();

  @override
  Widget build(BuildContext context) {
    // List worldStatsList = statsServices.fetWorldStats() as List;
    final mediaQuery = MediaQuery.of(context).size;
    var height = mediaQuery.height;
    var width = mediaQuery.width;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue[300],
          title: AutoSizeText(
            'Covid-19 Tracker ',
            style:
                GoogleFonts.abel(fontSize: height * 0.04, color: Colors.black),
          )),
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FutureBuilder(
                future: statsServices.fetWorldStats(),
                builder: (context, AsyncSnapshot<WorldReport> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                        child: detailContainer(height, width, snapshot));
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),

              // Flexible(child: detailContainer(height, width)),

              SizedBox(
                height: height * 0.04,
              ),

              FutureBuilder(
                future: statsServices.fetWorldStats(),
                builder: (context, AsyncSnapshot<WorldReport> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return Flexible(child: pieChart(height, width, snapshot));
                  }
                },
              ),

              // Flexible(child: pieChart(height, width)),
              SizedBox(
                height: height * 0.08,
              ),
              Flexible(
                  child: GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CountriesListScreen(),
                            ));
                      }),
                      child: analyticContainer(height, width))),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailContainer(
      double height, double width, AsyncSnapshot<WorldReport> snapshot) {
    String activeCases = snapshot.data!.active.toString();
    return Container(
      width: width * 0.7,
      height: height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Image(
              color: Colors.pink[400],
              image: const AssetImage(r'assets/images/virus.png'),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  activeCases,
                  wrapWords: false,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const AutoSizeText(
                  'Infected',
                  style: TextStyle(
                    fontSize: 24,

                    //height: height * 0.06,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget analyticContainer(double height, double width) {
    return SizedBox(
      height: height * 0.5,
      width: width * 0.9,
      child: Stack(alignment: Alignment.center, children: [
        ClipPath(
          clipper: AnalyticContainerClipper(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 33, 47, 243),
                    Color.fromARGB(255, 172, 94, 185)
                  ]),
            ),
          ),
        ),
        const Positioned(
            top: 30,
            left: 50,
            right: 20,
            child: AutoSizeText(
              'Analytic',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )),
        const Positioned(
          top: 70,
          left: 50,
          right: 0,
          child: AutoSizeText(
              style: TextStyle(fontSize: 20),
              'Analytic covid 19 Progression\nby country and location '),
        ),
        const Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(color: Colors.white, Icons.arrow_forward_ios_outlined),
          ),
        ),
      ]),
    );
  }

  Widget pieChart(
      double height, double width, AsyncSnapshot<WorldReport> snapshot) {
    return SizedBox(
      height: height * 0.2,
      width: width * 0.6,
      child: PieChart(
        dataMap: {
          "total": double.parse(snapshot.data!.cases.toString()),
          "recovered": double.parse(snapshot.data!.recovered.toString()),
          "deaths": double.parse(snapshot.data!.deaths.toString()),
          'todayCases': double.parse(snapshot.data!.todayCases.toString()),
          'todayDeaths': double.parse(snapshot.data!.todayDeaths.toString()),
          // 'population': double.parse(snapshot.data!.population.toString()),
        },
        animationDuration: const Duration(seconds: 2),
        chartType: ChartType.ring,
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
      ),
    );
  }

  double percentage(double value, double totalValue) {
    double resultOfValueDivdeTotalValue = value / totalValue;

    return resultOfValueDivdeTotalValue * 100;
  }
}
