import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mi_zone/Constants/constants.dart';
import 'package:mi_zone/screens/Login.dart';
import 'package:video_player/video_player.dart';

List<sectionmodel> sectionsList = [
  sectionmodel("Login/Regster", {}, "lib/assets/icon/login_icon.svg"),
  sectionmodel("Memorials", {}, "lib/assets/icon/memorials_icon.svg"),
  sectionmodel("Valuetainment", {}, "lib/assets/icon/valuetainment_icon.svg"),
  sectionmodel("Marketplace", {}, "lib/assets/icon/marketplace_icon.svg"),
  sectionmodel("MI Space", {}, "lib/assets/icon/mi_space.svg"),
];
final List<String> imgList1 = [
  'lib/assets/banners/pop_and_spin1.png',
  "lib/assets/banners/pop_and_spin2.png",
  "lib/assets/banners/pop_and_spin3.png"
];
TextEditingController _searchContoller = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<VideoObject> video_trailers = [];
final GlobalKey<ScaffoldState> _key = GlobalKey();

class VideoObject {
  final String id;
  final String video_title;
  final String video_description;
  final String video_link;
  VideoObject(
      this.id, this.video_title, this.video_description, this.video_link);
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        appBar: AppBar(
          elevation: 12,
          surfaceTintColor: Colors.white,
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          leading: InkWell(
              onTap: () {
                print("ghgg");
                _key.currentState?.openDrawer();
              },
              child: RotatedBox(
                quarterTurns: 1,
                child: Container(
                  height: 31,
                  width: 32,
                  child: Icon(
                    FeatherIcons.barChart2,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Constants.isLoggedIn == false
                  ? Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: CarouselSlider(
                              disableGesture: true,
                              carouselController: _controller,
                              options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  clipBehavior: Clip.antiAlias,
                                  padEnds: false,
                                  aspectRatio: 16 / 9.5,
                                  autoPlayInterval: const Duration(seconds: 8),
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                              items: imgList1
                                  .map((item) => Builder(
                                        builder: (BuildContext context) {
                                          return Stack(
                                            children: [
                                              Container(
                                                /* decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: Colors.grey.withOpacity(0.1),
                                              ),*/
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 0.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                    child: Container(
                                                      child: Image.asset(
                                                        item,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Spacer(),
                                                  Container(
                                                    height: 20,
                                                    color: Colors.black
                                                        .withOpacity(0.65),
                                                    child: Center(
                                                        child: Text(
                                                      "Get R50,000 cover when you join",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  )
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      ))
                                  .toList())))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  Constants.myDisplayname,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Customer Number - ${Constants.myUid}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Update Details".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14.5,
                                      color: Constants.ctaColorLight,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, bottom: 12, top: 8),
                                  child: Text(
                                    "Your total account balance -",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, bottom: 12),
                                  child: RichText(
                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: const TextStyle(
                                        fontSize: 28.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'R',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: '399',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 6,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8)),
                                          /* border: Border.all(
                          width: 3,
                          color: Colors.green,
                          style: BorderStyle.solid,
                        ),*/
                                        ),
                                      ),
                                      Container(
                                        height: 6,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          color: Constants.ctaColorLight,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          /* border: Border.all(
                          width: 3,
                          color: Colors.green,
                          style: BorderStyle.solid,
                        ),*/
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, bottom: 12, top: 12),
                                  child: Text(
                                    "Due by 31/01/2019",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(360),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.35))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360),
                                  child: Image.asset(
                                    "lib/assets/artist-white.png",
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        child: Container(
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: Material(
                              elevation: 10,
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, bottom: 0.0, right: 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Constants.ctaColorLight,
                                              borderRadius:
                                                  BorderRadius.circular(360)),
                                          child: Center(
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  hintText: 'Search',
                                  hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.09),
                                  contentPadding: EdgeInsets.only(left: 24),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.0)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.0)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                controller: _searchContoller,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 0, top: 8),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      crossAxisCount: 4,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.7)),
                  itemCount: sectionsList.length,
                  padding: EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  print("index " + index.toString());
                                  if (index == 0) {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()))
                                        .then((_) {
                                      Constants.pageLevel = 1;
                                    });
                                  } else if (index == 4) {
                                    /* Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomersReport())).then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 1) {
                                    /*   Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ExecutiveCollectionsReport()))
                                        .then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 2) {
                                    /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MaintenanceReport())).then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 3) {
                                    /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ClaimsReport())).then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 8) {
                                    /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReprintsAndCancellationsReport()))
                                        .then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 7) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             PolicyInformation())).then((_) {
                                    //   Constants.pageLevel = 1;
                                    // });
                                  } else if (index == 6) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             CommsReport())).then((_) {
                                    //   Constants.pageLevel = 1;
                                    // });
                                  } else if (index == 10) {
                                    // _showPasswordDialog();
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoraleIndexReport()));*/
                                  } else if (index == 9) {
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoon())).then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else if (index == 5) {
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ExecutiveCommisionsReport()))
                                        .then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  } else {
                                    /*    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoon())).then((_) {
                                      Constants.pageLevel = 1;
                                    });*/
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0.0, right: 8),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          /*         decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.35)),
                                              borderRadius:
                                                  BorderRadius.circular(360)),*/
                                          child: Card(
                                            elevation: 6,
                                            surfaceTintColor: Colors.white,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(360)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.04),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset: Offset(0,
                                                        -2), // Offset to show the shadow at the top
                                                  ),
                                                ],
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 370,
                                              /*     decoration: BoxDecoration(
                                                    color:Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors
                                                            .grey.withOpacity(0.2))),*/
                                              margin: EdgeInsets.only(
                                                  right: 0, left: 0, bottom: 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(24.0),
                                                child: SvgPicture.asset(
                                                  sectionsList[index].image,
                                                  fit: BoxFit.contain,
                                                  // color: Colors.black,
                                                  color: Constants.ctaColorLight
                                                      .withOpacity(0.90),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        child: Column(
                                          children: [
                                            Center(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0, bottom: 0),
                                              child: Text(
                                                sectionsList[index].id,
                                                style: TextStyle(
                                                    fontSize: 10.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              ),
                                            )),
                                            Spacer(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                child: Text(
                  "Valuetainment",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                child: VideoListView(),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.03),
                    child: Container(
                      width: MediaQuery.of(context).size.height,
                      color: Colors.grey.withOpacity(0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 55.0, bottom: 8),
                            child: Container(
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: Constants.ctaColorLight,
                                child: Center(
                                    // child: SvgPicture.string(svgCode),
                                    child: Icon(
                                  Iconsax.user,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          ),
                          Text(
                            Constants.myDisplayname,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontFamily: "TradeGothic",
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16),
                            child: Text(
                              Constants.myEmail,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontFamily: "TradeGothic",
                                    fontSize: 15.5,
                                    letterSpacing: 0.8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
/*                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: ListTile(
                    title: Text(
                      "Sales Report",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff121212),
                      ),
                    ),
                    //  trailing: Icon(Icons.arrow_forward),
                    leading:
                        Icon(CupertinoIcons.cart, color: Color(0xcc121212)),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 30),
                  child: Container(
                    height: 1,
                    color: Color(0x33c2c5cc),
                  ),
                ),
                Constants.isAdmin
                    ? InkWell(
                        onTap: () {
                          */ /*   Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => admin()));*/ /*
                        },
                        child: ListTile(
                          title: Text(
                            "Admin",
                            style: TextStyle(
                              color: Color(0xff121212),
                              fontFamily: "TradeGothic",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //   trailing: Icon(Icons.arrow_forward),
                          leading: Icon(CupertinoIcons.person,
                              color: Color(0xcc121212)),
                        ),
                      )
                    : Container(),*/
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: ListTile(
                      title: Text(
                        "Support",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff121212),
                        ),
                      ),
                      //  trailing: Icon(Icons.arrow_forward),
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset("assets/icons/sales_logo.svg",
                            color: Color(0xcc121212)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SalesReport(),
                          ),
                        ).then((_) {
                          Constants.pageLevel = 1;
                        });*/
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 30),
                    child: Container(
                      height: 1,
                      color: Color(0x33c2c5cc),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: ListTile(
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff121212),
                        ),
                      ),
                      //  trailing: Icon(Icons.arrow_forward),
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                            "assets/icons/collections_logo.svg",
                            color: Color(0xcc121212)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SalesAgentCollectionsReport(),
                        //   ),
                        // ).then((_) {
                        //   Constants.pageLevel = 1;
                        // });
                        ;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 30),
                    child: Container(
                      height: 1,
                      color: Color(0x33c2c5cc),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: ListTile(
                      title: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff121212),
                        ),
                      ),
                      //  trailing: Icon(Icons.arrow_forward),
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                            "assets/icons/policy_search.svg",
                            color: Color(0xcc121212)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PolicyInformation(),
                          ),
                        ).then((_) {
                          Constants.pageLevel = 1;
                        });*/
                      },
                    ),
                  ),
                  /*Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 30),
                  child: Container(
                    height: 1,
                    color: Color(0x33c2c5cc),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: ListTile(
                    title: Text(
                      "Comms",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff121212),
                      ),
                    ),
                    //  trailing: Icon(Icons.arrow_forward),
                    leading: Container(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                          "assets/icons/commission_logo.svg",
                          color: Color(0xcc121212)),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommsReport(),
                        ),
                      ).then((_) {
                        Constants.pageLevel = 1;
                      });
                      ;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 30),
                  child: Container(
                    height: 1,
                    color: Color(0x33c2c5cc),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: ListTile(
                      title: Text(
                        "Morale Index",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff121212),
                        ),
                      ),
                      //  trailing: Icon(Icons.arrow_forward),
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                            "assets/icons/people_matters.svg",
                            color: Color(0xcc121212)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        String hashedInput =
                            _hashPassword(_passwordController.text);
                        print("hashedInput $hashedInput");
                        if (hashedInput == _correctPasswordHash &&
                            _passwordAttempts < 3) {
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoraleIndexReport(),
                            ),
                          ).then((_) {
                            Constants.pageLevel = 1;
                          });
                          _passwordAttempts = 0;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 30),
                  child: Container(
                    height: 1,
                    color: Color(0x33c2c5cc),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: ListTile(
                      title: Text(
                        "Attendance",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff121212),
                        ),
                      ),
                      //  trailing: Icon(Icons.arrow_forward),
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                            "assets/icons/attendance.svg",
                            color: Color(0xcc121212)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(); // Close the dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendanceReport(),
                          ),
                        ).then((_) {
                          Constants.pageLevel = 1;
                        });
                      }),
                ),*/
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 30),
                    child: Container(
                      height: 1,
                      color: Color(0x33c2c5cc),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: ListTile(
                        title: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff121212),
                          ),
                        ),
                        //  trailing: Icon(Icons.arrow_forward),
                        leading: Container(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                              "assets/icons/commission_logo.svg",
                              color: Color(0xcc121212)),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 30),
                    child: Container(
                      height: 1,
                      color: Color(0x33c2c5cc),
                    ),
                  ),

                  /*  InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => settings()));
                  },
                  child: ListTile(
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff121212),
                      ),
                    ),
                    //   trailing: Icon(Icons.arrow_forward),
                    leading:
                        Icon(CupertinoIcons.settings, color: Color(0xcc121212)),
                  ),
                ),*/
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 85),
                    child: Container(
                      height: 1,
                      color: Color(0x33c2c5cc),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () {
                        //Sharedprefs.saveUserLoggedInSharedPreference(false);
                        //Sharedprefs.saveUserEmailSharedPreference("");
                        //Sharedprefs.saveUserCecClientIdSharedPreference(-1);
                        //Sharedprefs.saveUserEmpIdSharedPreference(-1);
                        Navigator.of(context).pop();
                        Constants.isLoggedIn = true;
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            color: Constants.ctaColorLight,
                            borderRadius: BorderRadius.circular(360)),
                        child: Center(
                          child: Text('Sign Out',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "TradeGothic",
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  @override
  void initState() {
    video_trailers.add(VideoObject(
        "1",
        "Sample Video 1",
        "Sample Video Description 1",
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4"));
    video_trailers.add(VideoObject(
        "2",
        "Sample Video 2",
        "Sample Video Description 2",
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4"));
    super.initState();
  }
}

class sectionmodel {
  String id;
  Map map;
  String image;
  sectionmodel(this.id, this.map, this.image);
}

class VideoListView extends StatefulWidget {
  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  List<VideoObject> video_trailers = [];

  @override
  void initState() {
    video_trailers.add(VideoObject(
        "1",
        "Sample Video 1",
        "Sample Video Description 1",
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4"));
    video_trailers.add(VideoObject(
        "2",
        "Sample Video 2",
        "Sample Video Description 2",
        "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: video_trailers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 2.3,
            child: VideoWidget(
              videoUrl: video_trailers[index].video_link,
              videoname: video_trailers[index].video_title,
              videodescription: video_trailers[index].video_description,
            ),
          );
        },
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String videoname;
  final String videodescription;

  VideoWidget({
    required this.videoUrl,
    required this.videoname,
    required this.videodescription,
  });

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Optionally navigate to a new page
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VideoPlayPage(
            videoUrl: widget.videoUrl,
            videoname: widget.videoname,
            videodescription: widget.videodescription,
          ),
        ));
      },
      child: _controller.value.isInitialized
          ? Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200,
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                        if (!_controller.value.isPlaying)
                          Icon(Icons.play_circle_fill,
                              size: 64, color: Colors.white),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.videoname,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        widget.videodescription,
                        maxLines: 1,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VideoPlayPage extends StatelessWidget {
  final String videoUrl;
  final String videoname;
  final String videodescription;

  VideoPlayPage(
      {required this.videoUrl,
      required this.videoname,
      required this.videodescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: VideoWidget(
        videoUrl: videoUrl,
        videoname: videoname,
        videodescription: videodescription,
      ),
    );
  }
}
