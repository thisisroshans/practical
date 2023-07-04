// To parse this JSON data, do
//
//     final launches = launchesFromJson(jsonString);

import 'dart:convert';

List<LaunchesModel> launchesFromJson(String str) => List<LaunchesModel>.from(json.decode(str).map((x) => LaunchesModel.fromJson(x)));

String launchesToJson(List<LaunchesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaunchesModel {
  int flightNumber;
  String missionName;
  List<String> missionId;
  bool upcoming;
  String launchYear;
  int launchDateUnix;
  DateTime launchDateUtc;
  DateTime launchDateLocal;
  bool isTentative;
  TentativeMaxPrecision tentativeMaxPrecision;
  bool tbd;
  int? launchWindow;
  Rocket rocket;
  List<String> ships;
  Telemetry telemetry;
  LaunchSite launchSite;
  bool? launchSuccess;
  LaunchFailureDetails? launchFailureDetails;
  Links links;
  String? details;
  DateTime? staticFireDateUtc;
  int? staticFireDateUnix;
  Map<String, int>? timeline;

  LaunchesModel({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.isTentative,
    required this.tentativeMaxPrecision,
    required this.tbd,
    this.launchWindow,
    required this.rocket,
    required this.ships,
    required this.telemetry,
    required this.launchSite,
    this.launchSuccess,
    this.launchFailureDetails,
    required this.links,
    this.details,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.timeline,
  });

  factory LaunchesModel.fromJson(Map<String, dynamic> json) => LaunchesModel(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    missionId: List<String>.from(json["mission_id"].map((x) => x)),
    upcoming: json["upcoming"],
    launchYear: json["launch_year"],
    launchDateUnix: json["launch_date_unix"],
    launchDateUtc: DateTime.parse(json["launch_date_utc"]),
    launchDateLocal: DateTime.parse(json["launch_date_local"]),
    isTentative: json["is_tentative"],
    tentativeMaxPrecision: tentativeMaxPrecisionValues.map[json["tentative_max_precision"]]!,
    tbd: json["tbd"],
    launchWindow: json["launch_window"],
    rocket: Rocket.fromJson(json["rocket"]),
    ships: List<String>.from(json["ships"].map((x) => x)),
    telemetry: Telemetry.fromJson(json["telemetry"]),
    launchSite: LaunchSite.fromJson(json["launch_site"]),
    launchSuccess: json["launch_success"],
    launchFailureDetails: json["launch_failure_details"] == null ? null : LaunchFailureDetails.fromJson(json["launch_failure_details"]),
    links: Links.fromJson(json["links"]),
    details: json["details"],
    staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
    staticFireDateUnix: json["static_fire_date_unix"],
    timeline: Map.from(json["timeline"]!).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "mission_id": List<dynamic>.from(missionId.map((x) => x)),
    "upcoming": upcoming,
    "launch_year": launchYear,
    "launch_date_unix": launchDateUnix,
    "launch_date_utc": launchDateUtc.toIso8601String(),
    "launch_date_local": launchDateLocal.toIso8601String(),
    "is_tentative": isTentative,
    "tentative_max_precision": tentativeMaxPrecisionValues.reverse[tentativeMaxPrecision],
    "tbd": tbd,
    "launch_window": launchWindow,
    "rocket": rocket.toJson(),
    "ships": List<dynamic>.from(ships.map((x) => x)),
    "telemetry": telemetry.toJson(),
    "launch_site": launchSite.toJson(),
    "launch_success": launchSuccess,
    "launch_failure_details": launchFailureDetails?.toJson(),
    "links": links.toJson(),
    "details": details,
    "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
    "static_fire_date_unix": staticFireDateUnix,
    "timeline": Map.from(timeline!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class LaunchFailureDetails {
  int time;
  int? altitude;
  String reason;

  LaunchFailureDetails({
    required this.time,
    this.altitude,
    required this.reason,
  });

  factory LaunchFailureDetails.fromJson(Map<String, dynamic> json) => LaunchFailureDetails(
    time: json["time"],
    altitude: json["altitude"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "altitude": altitude,
    "reason": reason,
  };
}

class LaunchSite {
  SiteId siteId;
  SiteName siteName;
  SiteNameLong siteNameLong;

  LaunchSite({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
    siteId: siteIdValues.map[json["site_id"]]!,
    siteName: siteNameValues.map[json["site_name"]]!,
    siteNameLong: siteNameLongValues.map[json["site_name_long"]]!,
  );

  Map<String, dynamic> toJson() => {
    "site_id": siteIdValues.reverse[siteId],
    "site_name": siteNameValues.reverse[siteName],
    "site_name_long": siteNameLongValues.reverse[siteNameLong],
  };
}

enum SiteId { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteIdValues = EnumValues({
  "ccafs_slc_40": SiteId.CCAFS_SLC_40,
  "ksc_lc_39a": SiteId.KSC_LC_39_A,
  "kwajalein_atoll": SiteId.KWAJALEIN_ATOLL,
  "vafb_slc_4e": SiteId.VAFB_SLC_4_E
});

enum SiteName { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteNameValues = EnumValues({
  "CCAFS SLC 40": SiteName.CCAFS_SLC_40,
  "KSC LC 39A": SiteName.KSC_LC_39_A,
  "Kwajalein Atoll": SiteName.KWAJALEIN_ATOLL,
  "VAFB SLC 4E": SiteName.VAFB_SLC_4_E
});

enum SiteNameLong { KWAJALEIN_ATOLL_OMELEK_ISLAND, CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40, VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E, KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A }

final siteNameLongValues = EnumValues({
  "Cape Canaveral Air Force Station Space Launch Complex 40": SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
  "Kennedy Space Center Historic Launch Complex 39A": SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
  "Kwajalein Atoll Omelek Island": SiteNameLong.KWAJALEIN_ATOLL_OMELEK_ISLAND,
  "Vandenberg Air Force Base Space Launch Complex 4E": SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
});

class Links {
  String? missionPatch;
  String? missionPatchSmall;
  String? redditCampaign;
  String? redditLaunch;
  String? redditRecovery;
  String? redditMedia;
  String? presskit;
  String? articleLink;
  String? wikipedia;
  String? videoLink;
  String? youtubeId;
  List<String> flickrImages;

  Links({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    this.articleLink,
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
    required this.flickrImages,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    missionPatch: json["mission_patch"],
    missionPatchSmall: json["mission_patch_small"],
    redditCampaign: json["reddit_campaign"],
    redditLaunch: json["reddit_launch"],
    redditRecovery: json["reddit_recovery"],
    redditMedia: json["reddit_media"],
    presskit: json["presskit"],
    articleLink: json["article_link"],
    wikipedia: json["wikipedia"],
    videoLink: json["video_link"],
    youtubeId: json["youtube_id"],
    flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mission_patch": missionPatch,
    "mission_patch_small": missionPatchSmall,
    "reddit_campaign": redditCampaign,
    "reddit_launch": redditLaunch,
    "reddit_recovery": redditRecovery,
    "reddit_media": redditMedia,
    "presskit": presskit,
    "article_link": articleLink,
    "wikipedia": wikipedia,
    "video_link": videoLink,
    "youtube_id": youtubeId,
    "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
  };
}

class Rocket {
  RocketId rocketId;
  RocketName rocketName;
  RocketType rocketType;
  FirstStage firstStage;
  SecondStage secondStage;
  Fairings? fairings;

  Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
    required this.firstStage,
    required this.secondStage,
    this.fairings,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
    rocketId: rocketIdValues.map[json["rocket_id"]]!,
    rocketName: rocketNameValues.map[json["rocket_name"]]!,
    rocketType: rocketTypeValues.map[json["rocket_type"]]!,
    firstStage: FirstStage.fromJson(json["first_stage"]),
    secondStage: SecondStage.fromJson(json["second_stage"]),
    fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
  );

  Map<String, dynamic> toJson() => {
    "rocket_id": rocketIdValues.reverse[rocketId],
    "rocket_name": rocketNameValues.reverse[rocketName],
    "rocket_type": rocketTypeValues.reverse[rocketType],
    "first_stage": firstStage.toJson(),
    "second_stage": secondStage.toJson(),
    "fairings": fairings?.toJson(),
  };
}

class Fairings {
  bool reused;
  bool? recoveryAttempt;
  bool? recovered;
  String? ship;

  Fairings({
    required this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ship,
  });

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
    reused: json["reused"],
    recoveryAttempt: json["recovery_attempt"],
    recovered: json["recovered"],
    ship: json["ship"],
  );

  Map<String, dynamic> toJson() => {
    "reused": reused,
    "recovery_attempt": recoveryAttempt,
    "recovered": recovered,
    "ship": ship,
  };
}

class FirstStage {
  List<Core> cores;

  FirstStage({
    required this.cores,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
  };
}

class Core {
  String? coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landSuccess;
  bool? landingIntent;
  LandingType? landingType;
  LandingVehicle? landingVehicle;

  Core({
    this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landSuccess,
    this.landingIntent,
    this.landingType,
    this.landingVehicle,
  });

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    coreSerial: json["core_serial"],
    flight: json["flight"],
    block: json["block"],
    gridfins: json["gridfins"],
    legs: json["legs"],
    reused: json["reused"],
    landSuccess: json["land_success"],
    landingIntent: json["landing_intent"],
    landingType: landingTypeValues.map[json["landing_type"]]!,
    landingVehicle: landingVehicleValues.map[json["landing_vehicle"]]!,
  );

  Map<String, dynamic> toJson() => {
    "core_serial": coreSerial,
    "flight": flight,
    "block": block,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "land_success": landSuccess,
    "landing_intent": landingIntent,
    "landing_type": landingTypeValues.reverse[landingType],
    "landing_vehicle": landingVehicleValues.reverse[landingVehicle],
  };
}

enum LandingType { OCEAN, ASDS, RTLS }

final landingTypeValues = EnumValues({
  "ASDS": LandingType.ASDS,
  "Ocean": LandingType.OCEAN,
  "RTLS": LandingType.RTLS
});

enum LandingVehicle { JRTI_1, OCISLY, LZ_1, JRTI, LZ_2, LZ_4 }

final landingVehicleValues = EnumValues({
  "JRTI": LandingVehicle.JRTI,
  "JRTI-1": LandingVehicle.JRTI_1,
  "LZ-1": LandingVehicle.LZ_1,
  "LZ-2": LandingVehicle.LZ_2,
  "LZ-4": LandingVehicle.LZ_4,
  "OCISLY": LandingVehicle.OCISLY
});

enum RocketId { FALCON1, FALCON9, FALCONHEAVY }

final rocketIdValues = EnumValues({
  "falcon1": RocketId.FALCON1,
  "falcon9": RocketId.FALCON9,
  "falconheavy": RocketId.FALCONHEAVY
});

enum RocketName { FALCON_1, FALCON_9, FALCON_HEAVY }

final rocketNameValues = EnumValues({
  "Falcon 1": RocketName.FALCON_1,
  "Falcon 9": RocketName.FALCON_9,
  "Falcon Heavy": RocketName.FALCON_HEAVY
});

enum RocketType { MERLIN_A, MERLIN_C, V1_0, V1_1, FT }

final rocketTypeValues = EnumValues({
  "FT": RocketType.FT,
  "Merlin A": RocketType.MERLIN_A,
  "Merlin C": RocketType.MERLIN_C,
  "v1.0": RocketType.V1_0,
  "v1.1": RocketType.V1_1
});

class SecondStage {
  int? block;
  List<Payload> payloads;

  SecondStage({
    this.block,
    required this.payloads,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
    block: json["block"],
    payloads: List<Payload>.from(json["payloads"].map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "block": block,
    "payloads": List<dynamic>.from(payloads.map((x) => x.toJson())),
  };
}

class Payload {
  String payloadId;
  List<int> noradId;
  bool reused;
  List<String> customers;
  String? nationality;
  String? manufacturer;
  PayloadType payloadType;
  double? payloadMassKg;
  double? payloadMassLbs;
  String orbit;
  OrbitParams orbitParams;
  String? capSerial;
  double? massReturnedKg;
  double? massReturnedLbs;
  int? flightTimeSec;
  String? cargoManifest;

  Payload({
    required this.payloadId,
    required this.noradId,
    required this.reused,
    required this.customers,
    this.nationality,
    this.manufacturer,
    required this.payloadType,
    this.payloadMassKg,
    this.payloadMassLbs,
    required this.orbit,
    required this.orbitParams,
    this.capSerial,
    this.massReturnedKg,
    this.massReturnedLbs,
    this.flightTimeSec,
    this.cargoManifest,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    payloadId: json["payload_id"],
    noradId: List<int>.from(json["norad_id"].map((x) => x)),
    reused: json["reused"],
    customers: List<String>.from(json["customers"].map((x) => x)),
    nationality: json["nationality"],
    manufacturer: json["manufacturer"],
    payloadType: payloadTypeValues.map[json["payload_type"]]!,
    payloadMassKg: json["payload_mass_kg"]?.toDouble(),
    payloadMassLbs: json["payload_mass_lbs"]?.toDouble(),
    orbit: json["orbit"],
    orbitParams: OrbitParams.fromJson(json["orbit_params"]),
    capSerial: json["cap_serial"],
    massReturnedKg: json["mass_returned_kg"]?.toDouble(),
    massReturnedLbs: json["mass_returned_lbs"]?.toDouble(),
    flightTimeSec: json["flight_time_sec"],
    cargoManifest: json["cargo_manifest"],
  );

  Map<String, dynamic> toJson() => {
    "payload_id": payloadId,
    "norad_id": List<dynamic>.from(noradId.map((x) => x)),
    "reused": reused,
    "customers": List<dynamic>.from(customers.map((x) => x)),
    "nationality": nationality,
    "manufacturer": manufacturer,
    "payload_type": payloadTypeValues.reverse[payloadType],
    "payload_mass_kg": payloadMassKg,
    "payload_mass_lbs": payloadMassLbs,
    "orbit": orbit,
    "orbit_params": orbitParams.toJson(),
    "cap_serial": capSerial,
    "mass_returned_kg": massReturnedKg,
    "mass_returned_lbs": massReturnedLbs,
    "flight_time_sec": flightTimeSec,
    "cargo_manifest": cargoManifest,
  };
}

class OrbitParams {
  ReferenceSystem? referenceSystem;
  Regime? regime;
  double? longitude;
  double? semiMajorAxisKm;
  double? eccentricity;
  double? periapsisKm;
  double? apoapsisKm;
  double? inclinationDeg;
  double? periodMin;
  double? lifespanYears;
  DateTime? epoch;
  double? meanMotion;
  double? raan;
  double? argOfPericenter;
  double? meanAnomaly;

  OrbitParams({
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
  });

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
    referenceSystem: referenceSystemValues.map[json["reference_system"]]!,
    regime: regimeValues.map[json["regime"]]!,
    longitude: json["longitude"]?.toDouble(),
    semiMajorAxisKm: json["semi_major_axis_km"]?.toDouble(),
    eccentricity: json["eccentricity"]?.toDouble(),
    periapsisKm: json["periapsis_km"]?.toDouble(),
    apoapsisKm: json["apoapsis_km"]?.toDouble(),
    inclinationDeg: json["inclination_deg"]?.toDouble(),
    periodMin: json["period_min"]?.toDouble(),
    lifespanYears: json["lifespan_years"]?.toDouble(),
    epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
    meanMotion: json["mean_motion"]?.toDouble(),
    raan: json["raan"]?.toDouble(),
    argOfPericenter: json["arg_of_pericenter"]?.toDouble(),
    meanAnomaly: json["mean_anomaly"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "reference_system": referenceSystemValues.reverse[referenceSystem],
    "regime": regimeValues.reverse[regime],
    "longitude": longitude,
    "semi_major_axis_km": semiMajorAxisKm,
    "eccentricity": eccentricity,
    "periapsis_km": periapsisKm,
    "apoapsis_km": apoapsisKm,
    "inclination_deg": inclinationDeg,
    "period_min": periodMin,
    "lifespan_years": lifespanYears,
    "epoch": epoch?.toIso8601String(),
    "mean_motion": meanMotion,
    "raan": raan,
    "arg_of_pericenter": argOfPericenter,
    "mean_anomaly": meanAnomaly,
  };
}

enum ReferenceSystem { GEOCENTRIC, HELIOCENTRIC, HIGHLY_ELLIPTICAL, SELENOCENTRIC }

final referenceSystemValues = EnumValues({
  "geocentric": ReferenceSystem.GEOCENTRIC,
  "heliocentric": ReferenceSystem.HELIOCENTRIC,
  "highly-elliptical": ReferenceSystem.HIGHLY_ELLIPTICAL,
  "selenocentric": ReferenceSystem.SELENOCENTRIC
});

enum Regime { LOW_EARTH, GEOSTATIONARY, L1_POINT, GEOSYNCHRONOUS, SUN_SYNCHRONOUS, HIGH_EARTH, SEMI_SYNCHRONOUS, SUB_ORBITAL }

final regimeValues = EnumValues({
  "geostationary": Regime.GEOSTATIONARY,
  "geosynchronous": Regime.GEOSYNCHRONOUS,
  "high-earth": Regime.HIGH_EARTH,
  "L1-point": Regime.L1_POINT,
  "low-earth": Regime.LOW_EARTH,
  "semi-synchronous": Regime.SEMI_SYNCHRONOUS,
  "sub-orbital": Regime.SUB_ORBITAL,
  "sun-synchronous": Regime.SUN_SYNCHRONOUS
});

enum PayloadType { SATELLITE, DRAGON_BOILERPLATE, DRAGON_10, DRAGON_11, UNKNOWN, LANDER, CREW_DRAGON }

final payloadTypeValues = EnumValues({
  "Crew Dragon": PayloadType.CREW_DRAGON,
  "Dragon 1.0": PayloadType.DRAGON_10,
  "Dragon 1.1": PayloadType.DRAGON_11,
  "Dragon Boilerplate": PayloadType.DRAGON_BOILERPLATE,
  "Lander": PayloadType.LANDER,
  "Satellite": PayloadType.SATELLITE,
  "Unknown": PayloadType.UNKNOWN
});

class Telemetry {
  String? flightClub;

  Telemetry({
    this.flightClub,
  });

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
    flightClub: json["flight_club"],
  );

  Map<String, dynamic> toJson() => {
    "flight_club": flightClub,
  };
}

enum TentativeMaxPrecision { HOUR, DAY, MONTH, QUARTER, HALF }

final tentativeMaxPrecisionValues = EnumValues({
  "day": TentativeMaxPrecision.DAY,
  "half": TentativeMaxPrecision.HALF,
  "hour": TentativeMaxPrecision.HOUR,
  "month": TentativeMaxPrecision.MONTH,
  "quarter": TentativeMaxPrecision.QUARTER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
