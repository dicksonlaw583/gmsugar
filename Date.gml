///Date(...)
{
var oldtzmode = date_get_timezone(),
    tzoffset = 0,
    datetime = 0;
switch (argument_count) {
  // Date(): Current datetime with current timezone settings
  case 0:
    return date_current_datetime();
  break;
  // Date("TZC", offset): Current datetime in given timezone, with offset in hours
  case 2:
    tzoffset = argument[1];
  // Date(""): Current local time
  // Date("TZC"): 
  case 1:
    date_set_timezone(timezone_utc);
    switch (argument[0]) {
      case "":
        date_set_timezone(timezone_local);
      break;
      case "UTC": tzoffset += 0; break;
      case "GMT": tzoffset += 0; break;
      // Source: https://en.wikipedia.org/wiki/List_of_time_zone_abbreviations (2017-08-22)
      // Attention users: Some duplicated abbreviations are commented out.
      // Please edit to suit the abbreviations most commonly used in your locale!
      case "ACDT": tzoffset += 10.5; break;
      case "ACST": tzoffset += 9.5; break;
      case "ACT": tzoffset += -5; break;
      case "ACWST": tzoffset += 8.75; break;
      case "ADT": tzoffset += -3; break;
      case "AEDT": tzoffset += 11; break;
      case "AEST": tzoffset += 10; break;
      case "AFT": tzoffset += 4.5; break;
      case "AKDT": tzoffset += -8; break;
      case "AKST": tzoffset += -9; break;
      case "AMST": tzoffset += -3; break;
      case "AMT": tzoffset += -4; break; //Amazon time
      // case "AMT": tzoffset += 4; break; //Armenia time
      case "ART": tzoffset += -3; break;
      // case "AST": tzoffset += 3; break; //Arabia standard time
      case "AST": tzoffset += -4; break; //Atlantic standard time
      case "AWST": tzoffset += 8; break;
      case "AZOST": tzoffset += 0; break;
      case "AZOT": tzoffset += -1; break;
      case "AZT": tzoffset += 4; break;
      case "BDT": tzoffset += 8; break;
      case "BIOT": tzoffset += 6; break;
      case "BIT": tzoffset += -12; break;
      case "BOT": tzoffset += -4; break;
      case "BRST": tzoffset += -2; break;
      case "BRT": tzoffset += -3; break;
      // case "BST": tzoffset += 6; break; //Bangladesh standard time
      // case "BST": tzoffset += 11; break; //Bougainville standard time
      case "BST": tzoffset += 1; break; //British standard time
      case "BTT": tzoffset += 6; break;
      case "CAT": tzoffset += 2; break;
      case "CCT": tzoffset += 6.5; break;
      case "CDT": tzoffset += -5; break; //Central daylight itme
      // case "CDT": tzoffset += -4; break; //Cuba daylight time
      case "CEST": tzoffset += 2; break;
      case "CET": tzoffset += 1; break;
      case "CHADT": tzoffset += 13.75; break;
      case "CHAST": tzoffset += 12.75; break;
      case "CHOT": tzoffset += 8; break;
      case "CHOST": tzoffset += 9; break;
      case "CHST": tzoffset += 10; break;
      case "CHUT": tzoffset += 10; break;
      case "CIST": tzoffset += -8; break;
      case "CIT": tzoffset += 8; break;
      case "CKT": tzoffset += -10; break;
      case "CLST": tzoffset += -3; break;
      case "CLT": tzoffset += -4; break;
      case "COST": tzoffset += -4; break;
      case "COT": tzoffset += -5; break;
      case "CST": tzoffset += -6; break; //Central standard time
      // case "CST": tzoffset += 8; break; //China standard time
      // case "CST": tzoffset += -5; break; //Cuba standard time
      case "CT": tzoffset += 8; break;
      case "CVT": tzoffset += -1; break;
      case "CWST": tzoffset += 8.75; break;
      case "CXT": tzoffset += 7; break;
      case "DAVT": tzoffset += 7; break;
      case "DDUT": tzoffset += 10; break;
      case "DFT": tzoffset += 1; break;
      case "EASST": tzoffset += -5; break;
      case "EAST": tzoffset += -6; break;
      case "EAT": tzoffset += 3; break;
      // case "ECT": tzoffset += -4; break; //Eastern Caribbean time
      case "ECT": tzoffset += -5; break; //Ecuador time
      case "EDT": tzoffset += -4; break;
      case "EEST": tzoffset += 3; break;
      case "EET": tzoffset += 2; break;
      case "EGST": tzoffset += 0; break;
      case "EGT": tzoffset += -1; break;
      case "EIT": tzoffset += 9; break;
      case "EST": tzoffset += -5; break;
      case "FET": tzoffset += 3; break;
      case "FJT": tzoffset += 12; break;
      case "FKST": tzoffset += -3; break;
      case "FKT": tzoffset += -4; break;
      case "FNT": tzoffset += -2; break;
      case "GALT": tzoffset += -6; break;
      case "GAMT": tzoffset += -9; break;
      case "GET": tzoffset += 4; break;
      case "GFT": tzoffset += -3; break;
      case "GILT": tzoffset += 12; break;
      case "GIT": tzoffset += -9; break;
      // case "GST": tzoffset += -2; break; //South Georgia and the South Sandwich Islands
      case "GST": tzoffset += 4; break; //Gulf standard time
      case "GYT": tzoffset += -4; break;
      case "HADT": tzoffset += -9; break;
      case "HAEC": tzoffset += 2; break;
      case "HAST": tzoffset += -10; break;
      case "HKT": tzoffset += 8; break;
      case "HMT": tzoffset += 5; break;
      case "HOVST": tzoffset += 8; break;
      case "HOVT": tzoffset += 7; break;
      case "ICT": tzoffset += 7; break;
      case "IDT": tzoffset += 3; break;
      case "IOT": tzoffset += 3; break;
      case "IRDT": tzoffset += 4.5; break;
      case "IRKT": tzoffset += 8; break;
      case "IRST": tzoffset += 3.5; break;
      case "IST": tzoffset += 5.5; break;
      //case "IST": tzoffset += 1; break; //Irish standard time
      //case "IST": tzoffset += 2; break; //Israel standard time
      case "JST": tzoffset += 9; break;
      case "KGT": tzoffset += 6; break;
      case "KOST": tzoffset += 11; break;
      case "KRAT": tzoffset += 7; break;
      case "KST": tzoffset += 9; break;
      case "LHST": tzoffset += 10.5; break; //Lord Howe standard time
      //case "LHST": tzoffset += 11; break; //Lord Howe summer time
      case "LINT": tzoffset += 14; break;
      case "MAGT": tzoffset += 12; break;
      case "MART": tzoffset += -9.5; break;
      case "MAWT": tzoffset += 5; break;
      case "MDT": tzoffset += -6; break;
      case "MET": tzoffset += 1; break;
      case "MEST": tzoffset += 2; break;
      case "MHT": tzoffset += 12; break;
      case "MIST": tzoffset += 11; break;
      case "MIT": tzoffset += -9.5; break;
      case "MMT": tzoffset += 6.5; break;
      case "MSK": tzoffset += 3; break;
      // case "MST": tzoffset += 8; break; //Malaysia standard time
      case "MST": tzoffset += -7; break; //Mountain standard time
      case "MUT": tzoffset += 4; break;
      case "MVT": tzoffset += 5; break;
      case "MYT": tzoffset += 8; break;
      case "NCT": tzoffset += 11; break;
      case "NDT": tzoffset += -2.5; break;
      case "NFT": tzoffset += 11; break;
      case "NPT": tzoffset += 5.75; break;
      case "NST": tzoffset += -3.5; break;
      case "NT": tzoffset += -3.5; break;
      case "NUT": tzoffset += -11; break;
      case "NZDT": tzoffset += 13; break;
      case "NZST": tzoffset += 12; break;
      case "OMST": tzoffset += 6; break;
      case "ORAT": tzoffset += 5; break;
      case "PDT": tzoffset += -7; break;
      case "PET": tzoffset += -5; break;
      case "PETT": tzoffset += 12; break;
      case "PGT": tzoffset += 10; break;
      case "PHOT": tzoffset += 13; break;
      case "PHT": tzoffset += 8; break;
      case "PKT": tzoffset += 5; break;
      case "PMDT": tzoffset += -2; break;
      case "PMST": tzoffset += -3; break;
      case "PONT": tzoffset += 11; break;
      case "PST": tzoffset += -8; break; //Pacific standard time
      // case "PST": tzoffset += 8; break; //Philippine standard time
      case "PYST": tzoffset += -3; break;
      case "PYT": tzoffset += -4; break;
      case "RET": tzoffset += 4; break;
      case "ROTT": tzoffset += -3; break;
      case "SAKT": tzoffset += 11; break;
      case "SAMT": tzoffset += 4; break;
      case "SAST": tzoffset += 2; break;
      case "SBT": tzoffset += 11; break;
      case "SCT": tzoffset += 4; break;
      case "SDT": tzoffset += -10; break;
      case "SGT": tzoffset += 8; break;
      case "SLST": tzoffset += 5.5; break;
      case "SRET": tzoffset += 11; break;
      case "SRT": tzoffset += -3; break;
      // case "SST": tzoffset += -11; break; //Samoa standard time
      case "SST": tzoffset += 8; break; //Singapore standard time
      case "SYOT": tzoffset += 3; break;
      case "TAHT": tzoffset += -10; break;
      case "THA": tzoffset += 7; break;
      case "TFT": tzoffset += 5; break;
      case "TJT": tzoffset += 5; break;
      case "TKT": tzoffset += 13; break;
      case "TLT": tzoffset += 9; break;
      case "TMT": tzoffset += 5; break;
      case "TRT": tzoffset += 3; break;
      case "TOT": tzoffset += 13; break;
      case "TVT": tzoffset += 12; break;
      case "ULAST": tzoffset += 9; break;
      case "ULAT": tzoffset += 8; break;
      case "USZ1": tzoffset += 2; break;
      case "UYST": tzoffset += -2; break;
      case "UYT": tzoffset += -3; break;
      case "UZT": tzoffset += 5; break;
      case "VET": tzoffset += -4; break;
      case "VLAT": tzoffset += 10; break;
      case "VOLT": tzoffset += 4; break;
      case "VOST": tzoffset += 6; break;
      case "VUT": tzoffset += 11; break;
      case "WAKT": tzoffset += 12; break;
      case "WAST": tzoffset += 2; break;
      case "WAT": tzoffset += 1; break;
      case "WEST": tzoffset += 1; break;
      case "WET": tzoffset += 0; break;
      case "WIT": tzoffset += 7; break;
      case "WST": tzoffset += 8; break;
      case "YAKT": tzoffset += 9; break;
      case "YEKT": tzoffset += 5; break;
    }
    datetime = date_inc_hour(date_current_datetime(), tzoffset);
  break;
  // Date(year, month, day)
  case 3:
    datetime = date_create_datetime(argument[0], argument[1], argument[2], 0, 0, 0);
  break;
  // Date(year, month, day, hour, minute, second)
  case 6:
    datetime = date_create_datetime(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
  break;
  // Wrong # of arguments
  default:
    show_error("Expecting 0, 1, 2, 3 or 6 arguments, got " + string(argument_count) + ".", true);
  break;
}
date_set_timezone(oldtzmode);
return datetime;
}
