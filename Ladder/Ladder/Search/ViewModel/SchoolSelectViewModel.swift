//
//  SchoolSelectViewModel.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import Foundation

//I know this is not good aproach. Maybe I could use json.
enum SchoolSelectViewModel: Int, CaseIterable , Codable{
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
    case i
    case j
    case k
    case l
    case m
    case n
    case o
    case p
    case q
    case r
    case s
    case t
    case u
    case v
    case w
    case x
    case y
    case z
    case aa
    case bb
    case cc
    case dd
    case ee
    case ff
    case gg
    case hh
    case ii
    case jj
    case kk
    case ll
    case mm
    case nn
    case oo
    case pp
    case qq
    case rr
    case ss
    case tt
    case uu
    case vv
    case ww
    case xx
    case yy
    case zz
    case aaa
    case bbb
    case ccc
    case ddd
    case eee
    case fff
    case ggg
    case hhh
    case iii
    case jjj
    case kkk
    case lll
    case mmm
    case nnn
    case ooo
    case ppp
    case qqq
    case rrr
    case sss
    case ttt
    case uuu
    case vvv
    case www
    case xxx
    case yyy
    case zzz
    case aaaa
    case bbbb
    case cccc
    case dddd
    case eeee
    case ffff
    case gggg
    case hhhh
    case iiii
    case jjjj
    case kkkk
    case llll
    case mmmm
    case nnnn
    case oooo
    case pppp
    case qqqq
    case rrrr
    case ssss
    case tttt
    case uuuu
    case vvvv
    case wwww
    case xxxx
    case yyyy
    case zzzz
    case aaaaa
    case bbbbb
    case ccccc
    case ddddd
    case eeeee
    case fffff
    case ggggg
    case hhhhh
    case iiiii
    case jjjjj
    case kkkkk
    case lllll
    case mmmmm
    case nnnnn
    case ooooo
    case ppppp
    case qqqqq
    case rrrrr
    case sssss
    case ttttt
    case uuuuu
    case vvvvv
    case wwwww
    case xxxxx
    case yyyyy
    case zzzzz
    case aaaaaa
    case bbbbbb
    case cccccc
    case dddddd
    case eeeeee
    case ffffff
    case gggggg
    case hhhhhh
    case iiiiii
    case jjjjjj
    case kkkkkk
    case llllll
    case mmmmmm
    case nnnnnn
    case oooooo
    case pppppp
    case qqqqqq
    case rrrrrr
    
    var schoolTitle: String {
        switch self {
        case .a: return "Allan Hancock College"
        case .b: return "American River College"
        case .c: return "Antelope Valley College"
        case .d: return "Bakersfield College"
        case .e: return "Barstow Community College"
        case .f: return "Berkeley City College"
        case .g: return "Butte College"
        case .h: return "Cabrillo College"
        case .i: return "Calbright College"
        case .j: return "Cañada College"
        case .k: return "Cerritos College"
        case .l: return "Cerro Coso Community College"
        case .m: return "Chabot College"
        case .n: return "Chaffey College"
        case .o: return "Citrus College"
        case .p: return "City College of San Francisco"
        case .q: return "Clovis Community College"
        case .r: return "Coastline Community College"
        case .s: return "College of Alameda"
        case .t: return "College of Marin"
        case .u: return "College of San Mateo"
        case .v: return "College of the Canyons"
        case .w: return "College of the Desert"
        case .x: return "College of the Redwoods"
        case .y: return "College of the Sequoias"
        case .z: return "College of the Siskiyous"
        case .aa: return "Columbia College"
        case .bb: return "Compton College"
        case .cc: return "Contra Costa College"
        case .dd: return "Copper Mountain College"
        case .ee: return "Cosumnes River College"
        case .ff: return "Crafton Hills College"
        case .gg: return "Cuesta College"
        case .hh: return "Cuyamaca College"
        case .ii: return "Cypress College"
        case .jj: return "De Anza College"
        case .kk: return "Diablo Valley College"
        case .ll: return "East Los Angeles College"
        case .mm: return "El Camino College"
        case .nn: return "Evergreen Valley College"
        case .oo: return "Feather River College"
        case .pp: return "Folsom Lake College"
        case .qq: return "Foothill College"
        case .rr: return "Fresno City College"
        case .ss: return "Fullerton College"
        case .tt: return "Gavilan College"
        case .uu: return "Glendale Community College"
        case .vv: return "Golden West College"
        case .ww: return "Grossmont College"
        case .xx: return "Hartnell College"
        case .yy: return "Imperial Valley College"
        case .zz: return "Irvine Valley College"
        case .aaa: return "Lake Tahoe Community College"
        case .bbb: return "Laney College"
        case .ccc: return "Las Positas College"
        case .ddd: return "Lassen College"
        case .eee: return "Long Beach City College"
        case .fff: return "Los Angeles City College"
        case .ggg: return "Los Angeles Harbor College"
        case .hhh: return "Los Angeles Mission College"
        case .iii: return "Los Angeles Pierce College"
        case .jjj: return "Los Angeles Southwest College"
        case .kkk: return "Los Angeles Trade-Tech College"
        case .lll: return "Los Angeles Valley College"
        case .mmm: return "Los Medanos College"
        case .nnn: return "Madera College"
        case .ooo: return "Mendocino College"
        case .ppp: return "Merced College"
        case .qqq: return "Merritt College"
        case .rrr: return "MiraCosta College"
        case .sss: return "Mission College"
        case .ttt: return "Modesto Junior College"
        case .uuu: return "Monterey Peninsula College"
        case .vvv: return "Moorpark College"
        case .www: return "Moreno Valley College"
        case .xxx: return "Mt. San Antonio College"
        case .yyy: return "Mt. San Jacinto College"
        case .zzz: return "Napa Valley College"
        case .aaaa: return "Norco College"
        case .bbbb: return "Ohlone College"
        case .cccc: return "Orange Coast College"
        case .dddd: return "Oxnard College"
        case .eeee: return "Palo Verde College"
        case .ffff: return "Palomar College"
        case .gggg: return "Pasadena City College"
        case .hhhh: return "Porterville College"
        case .iiii: return "Reedley College"
        case .jjjj: return "Rio Hondo College"
        case .kkkk: return "Riverside City College"
        case .llll: return "Sacramento City College"
        case .mmmm: return "Saddleback College"
        case .nnnn: return "San Bernardino Valley College"
        case .oooo: return "San Diego City College"
        case .pppp: return "San Diego Mesa College"
        case .qqqq: return "San Diego Miramar College"
        case .rrrr: return "San Joaquin Delta College"
        case .ssss: return "San Jose City College"
        case .tttt: return "Santa Ana College"
        case .uuuu: return "Santa Barbara City College"
        case .vvvv: return "Santa Monica College"
        case .wwww: return "Santa Rosa Junior College"
        case .xxxx: return "Santiago Canyon College"
        case .yyyy: return "Shasta College"
        case .zzzz: return "Sierra College"
        case .aaaaa: return "Skyline College"
        case .bbbbb: return "Solano Community College"
        case .ccccc: return "Southwestern College"
        case .ddddd: return "Taft College"
        case .eeeee: return "Ventura College"
        case .fffff: return "Victor Valley College"
        case .ggggg: return "West Hills College Coalinga"
        case .hhhhh: return "West Hills College Lemoore"
        case .iiiii: return "West Los Angeles College"
        case .jjjjj: return "West Valley College"
        case .kkkkk: return "Woodland Community College"
        case .lllll: return "Yuba College"
        case .mmmmm: return "UC Berkeley"
        case .nnnnn: return "UC Davis"
        case .ooooo: return "UC Irvine"
        case .ppppp: return "UCLA"
        case .qqqqq: return "UC Merced"
        case .rrrrr: return "UC Riverside"
        case .sssss: return "UC San Diego"
        case .ttttt: return "UC San Francisco"
        case .uuuuu: return "UC Santa Barbara"
        case .vvvvv: return "UC Santa Cruz"
        case .wwwww: return "California State University, Bakersfield"
        case .xxxxx: return "California State University, Channel Islands"
        case .yyyyy: return "California State University, Chico"
        case .zzzzz: return "California State University, Dominguez Hills"
        case .aaaaaa: return "California State University, East Bay"
        case .bbbbbb: return "California State University, Fresno"
        case .cccccc: return "California State University, Fullerton"
        case .dddddd: return "California State University, Long Beach"
        case .eeeeee: return "California State University, Los Angeles"
        case .ffffff: return "California State University, Monterey Bay"
        case .gggggg: return "California State University, Northridge"
        case .hhhhhh: return "California State Polytechnic University, Pomona"
        case .iiiiii: return "California State University, Sacramento"
        case .jjjjjj: return "California State University, San Bernardino"
        case .kkkkkk: return "California State University, San Marcos"
        case .llllll: return "California State University, Stanislaus"
        case .mmmmmm: return "California State Polytechnic University, San Luis Obispo"
        case .nnnnnn: return "San Diego State University"
        case .oooooo: return "San Francisco State University"
        case .pppppp: return "San Jose State University"
        case .qqqqqq: return "Sonoma State University"
        case .rrrrrr: return "Humboldt State University"
        }
    }
}

