import 'package:covid_tracker/components/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    Key? key,
    required this.active,
    required this.critical,
    required this.image,
    required this.name,
    required this.test,
    required this.totalCase,
    required this.todayRecoverd,
    required this.totalDeaths,
    required this.totalRecoverd,
  }) : super(key: key);

  String image, name;
  int? totalCase,
      totalDeaths,
      totalRecoverd,
      active,
      critical,
      todayRecoverd,
      test;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.name,
          style: GoogleFonts.abel(fontSize: height * 0.04, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: detailScreenBody(),
    );
  }

  detailScreenBody() {
    //var width = size.width;
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(widget.image, scale: 2),
            )),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'totalCase',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.totalCase.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'totalDeaths',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.totalDeaths.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'totalRecoverd',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.todayRecoverd.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'active',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.active.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'critical',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.critical.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'todayRecoverd',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.todayRecoverd.toString())),
                ),
                verticalSpace(),
                Expanded(
                  child: ReusableRow(
                      leading: Text(
                        'test',
                        style: GoogleFonts.abel(fontSize: size.height * 0.03),
                      ),
                      trailing: Text(widget.test.toString())),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  verticalSpace() {
    return SizedBox(
      height: size.height * 0.008,
    );
  }
}
