import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class InterstitialAds extends StatefulWidget {
  const InterstitialAds({super.key});

  @override
  State<InterstitialAds> createState() => _InterstitialAdsState();
}

class _InterstitialAdsState extends State<InterstitialAds> {
  var _interstitialRetryAttempt = 0;
  int clickCounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppLovinMAX.loadInterstitial("f645948c75451411");
    InterstitialAdListener();
    setState(() {
      clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APP LOVIN INTERSTITIAL ADs",style: TextStyle(fontSize: 22)),
          centerTitle: true,
          elevation: 10,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  showInterstitialAdifRedy();
                },
                child: Card(
                  elevation: 20,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Single Click",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text("Taped"),
                      ),
                      duration: Duration(milliseconds: 200),
                      showCloseIcon: true,
                    ),
                  );
                  setState(() {
                    clickCounter++;
                  });
                  if (clickCounter != 0 && clickCounter % 3 == 0) {
                    showInterstitialAdifRedy();
                  }
                },
                child: Card(
                  elevation: 20,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Every Third Click",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  showInterstitialAdifRedyWithoutListener();
                  AppLovinMAX.setInterstitialListener(InterstitialListener(
                    onAdLoadedCallback: (ad) {},
                    onAdLoadFailedCallback: (adUnitId, error) {
                      AppLovinMAX.loadInterstitial("f645948c75451411");
                    },
                    onAdDisplayedCallback: (ad) {
                      AppLovinMAX.loadInterstitial("f645948c75451411");
                    },
                    onAdDisplayFailedCallback: (ad, error) {
                      AppLovinMAX.loadInterstitial("f645948c75451411");
                    },
                    onAdClickedCallback: (ad) {
                      AppLovinMAX.loadInterstitial("f645948c75451411");
                    },
                    onAdHiddenCallback: (ad)  {
                      AppLovinMAX.loadInterstitial("f645948c75451411");
                      print(
                          "==================[Close Button Callback Without Listener]=====================");

                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("Close button event Handeled."),
                            actions: [TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("OK"))],
                          );
                        },);

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Close button Clicked")));
                    },
                  ));
                },
                child: Card(
                  elevation: 20,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Handle Close Event",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showInterstitialAdifRedy() async {
    bool isReady = (await AppLovinMAX.isInterstitialReady("f645948c75451411"))!;
    if (isReady) {
      AppLovinMAX.showInterstitial("f645948c75451411");
      InterstitialAdListener();
    } else {
      showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()));
      AppLovinMAX.loadInterstitial("f645948c75451411");
      await Future.delayed(Duration(seconds: 3)).whenComplete(() async {
        bool isReady =
            (await AppLovinMAX.isInterstitialReady("f645948c75451411"))!;
        if (isReady) {
          Navigator.pop(context);
          AppLovinMAX.showInterstitial("f645948c75451411");
          InterstitialAdListener();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something wents wrong")));
          Navigator.pop(context);
        }
      });
    }
  }

  void InterstitialAdListener() {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {},
      onAdLoadFailedCallback: (adUnitId, error) {
        AppLovinMAX.loadInterstitial("f645948c75451411");
      },
      onAdDisplayedCallback: (ad) {
        AppLovinMAX.loadInterstitial("f645948c75451411");
      },
      onAdDisplayFailedCallback: (ad, error) {
        AppLovinMAX.loadInterstitial("f645948c75451411");
      },
      onAdClickedCallback: (ad) {
        AppLovinMAX.loadInterstitial("f645948c75451411");
      },
      onAdHiddenCallback: (ad) {
        AppLovinMAX.loadInterstitial("f645948c75451411");
        print("==================[Close Button Callback]=====================");
      },
    ));
  }

  Future<void> showInterstitialAdifRedyWithoutListener() async {
    bool isReady = (await AppLovinMAX.isInterstitialReady("f645948c75451411"))!;
    if (isReady) {
      AppLovinMAX.showInterstitial("f645948c75451411");
    } else {
      showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()));
      AppLovinMAX.loadInterstitial("f645948c75451411");
      await Future.delayed(Duration(seconds: 3)).whenComplete(() async {
        bool isReady =
            (await AppLovinMAX.isInterstitialReady("f645948c75451411"))!;
        if (isReady) {
          Navigator.pop(context);
          AppLovinMAX.showInterstitial("f645948c75451411");
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something wents wrong")));
          Navigator.pop(context);
        }
      });
    }
  }
}
