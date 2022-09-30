import 'dart:convert';

import 'package:collection/collection.dart';

class WorldReport {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldReport({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
    this.affectedCountries,
  });

  @override
  String toString() {
    return 'WorldReport(updated: $updated, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, todayRecovered: $todayRecovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, population: $population, oneCasePerPeople: $oneCasePerPeople, oneDeathPerPeople: $oneDeathPerPeople, oneTestPerPeople: $oneTestPerPeople, activePerOneMillion: $activePerOneMillion, recoveredPerOneMillion: $recoveredPerOneMillion, criticalPerOneMillion: $criticalPerOneMillion, affectedCountries: $affectedCountries)';
  }

  factory WorldReport.fromMap(Map<String, dynamic> data) => WorldReport(
        updated: data['updated'] as int?,
        cases: data['cases'] as int?,
        todayCases: data['todayCases'] as int?,
        deaths: data['deaths'] as int?,
        todayDeaths: data['todayDeaths'] as int?,
        recovered: data['recovered'] as int?,
        todayRecovered: data['todayRecovered'] as int?,
        active: data['active'] as int?,
        critical: data['critical'] as int?,
        casesPerOneMillion: data['casesPerOneMillion'] as int?,
        deathsPerOneMillion: (data['deathsPerOneMillion'] as num?)?.toDouble(),
        tests: data['tests'] as int?,
        testsPerOneMillion: (data['testsPerOneMillion'] as num?)?.toDouble(),
        population: data['population'] as int?,
        oneCasePerPeople: data['oneCasePerPeople'] as int?,
        oneDeathPerPeople: data['oneDeathPerPeople'] as int?,
        oneTestPerPeople: data['oneTestPerPeople'] as int?,
        activePerOneMillion: (data['activePerOneMillion'] as num?)?.toDouble(),
        recoveredPerOneMillion:
            (data['recoveredPerOneMillion'] as num?)?.toDouble(),
        criticalPerOneMillion:
            (data['criticalPerOneMillion'] as num?)?.toDouble(),
        affectedCountries: data['affectedCountries'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WorldReport].
  factory WorldReport.fromJson(String data) {
    return WorldReport.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WorldReport] to a JSON string.
  String toJson() => json.encode(toMap());

  WorldReport copyWith({
    int? updated,
    int? cases,
    int? todayCases,
    int? deaths,
    int? todayDeaths,
    int? recovered,
    int? todayRecovered,
    int? active,
    int? critical,
    int? casesPerOneMillion,
    double? deathsPerOneMillion,
    int? tests,
    double? testsPerOneMillion,
    int? population,
    int? oneCasePerPeople,
    int? oneDeathPerPeople,
    int? oneTestPerPeople,
    double? activePerOneMillion,
    double? recoveredPerOneMillion,
    double? criticalPerOneMillion,
    int? affectedCountries,
  }) {
    return WorldReport(
      updated: updated ?? this.updated,
      cases: cases ?? this.cases,
      todayCases: todayCases ?? this.todayCases,
      deaths: deaths ?? this.deaths,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      recovered: recovered ?? this.recovered,
      todayRecovered: todayRecovered ?? this.todayRecovered,
      active: active ?? this.active,
      critical: critical ?? this.critical,
      casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
      deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
      tests: tests ?? this.tests,
      testsPerOneMillion: testsPerOneMillion ?? this.testsPerOneMillion,
      population: population ?? this.population,
      oneCasePerPeople: oneCasePerPeople ?? this.oneCasePerPeople,
      oneDeathPerPeople: oneDeathPerPeople ?? this.oneDeathPerPeople,
      oneTestPerPeople: oneTestPerPeople ?? this.oneTestPerPeople,
      activePerOneMillion: activePerOneMillion ?? this.activePerOneMillion,
      recoveredPerOneMillion:
          recoveredPerOneMillion ?? this.recoveredPerOneMillion,
      criticalPerOneMillion:
          criticalPerOneMillion ?? this.criticalPerOneMillion,
      affectedCountries: affectedCountries ?? this.affectedCountries,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WorldReport) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      updated.hashCode ^
      cases.hashCode ^
      todayCases.hashCode ^
      deaths.hashCode ^
      todayDeaths.hashCode ^
      recovered.hashCode ^
      todayRecovered.hashCode ^
      active.hashCode ^
      critical.hashCode ^
      casesPerOneMillion.hashCode ^
      deathsPerOneMillion.hashCode ^
      tests.hashCode ^
      testsPerOneMillion.hashCode ^
      population.hashCode ^
      oneCasePerPeople.hashCode ^
      oneDeathPerPeople.hashCode ^
      oneTestPerPeople.hashCode ^
      activePerOneMillion.hashCode ^
      recoveredPerOneMillion.hashCode ^
      criticalPerOneMillion.hashCode ^
      affectedCountries.hashCode;
}
