import 'package:applovin_max/applovin_max.dart';
import 'package:applovinads/BannerAds.dart';
import 'package:applovinads/InterstitialAds.dart';
import 'package:applovinads/RewardedAds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();


}

/*
SDK KEY : sh5eXxteJLhknssTa3LRTBClQFeJxGdqcfttK0aavQZRRnCPOeQAIRJJTZPw0o3aATB4tmmlkGeyU5mRbpaoRK
App Open Ad KEY : e6f30cdcd1d94b4a






 */
class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);//Used to Handle Background or Foreground events of Application
    AppLovinMAX.loadAppOpenAd("YOUR APP OPEN AD UNIT KEY");
    appOpenAdListener(); //Used to Handle All events of AppLovin App Open Ad.
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await showAppOpenAdIfReady();
        break;

      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APP LOVIN ADs"),
          centerTitle: true,
          elevation: 10,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              InkWell(
                onTap: () {
                  showAppOpenAdIfReady();
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
                        Icon(Icons.app_shortcut_outlined, color: Colors.black,),
                        Text("App Open Ad",
                          style: TextStyle(color: Colors.black, fontSize: 18),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BannerAds(),));
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
                        Icon(Icons.rectangle_outlined, color: Colors.black,),
                        Text("Banner Ad",
                          style: TextStyle(color: Colors.black, fontSize: 18),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InterstitialAds(),));
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
                        Icon(Icons.interests_outlined, color: Colors.black,),
                        Text("Interstitial Ad",
                          style: TextStyle(color: Colors.black, fontSize: 18),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RewardedAds(),));
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
                        Icon(Icons.currency_exchange, color: Colors.black,),
                        Text("Rewarded Ad",
                          style: TextStyle(color: Colors.black, fontSize: 18),)
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

  Future<void> showAppOpenAdIfReady() async {
    bool isReady = (await AppLovinMAX.isAppOpenAdReady("YOUR APP OPEN AD UNIT KEY"))!;
    if (isReady) {
      AppLovinMAX.showAppOpenAd("YOUR APP OPEN AD UNIT KEY");
    } else {
      AppLovinMAX.loadAppOpenAd("YOUR APP OPEN AD UNIT KEY");
    }
  }


  void appOpenAdListener() {
    AppLovinMAX.setAppOpenAdListener(
        AppOpenAdListener(
        onAdLoadedCallback: (ad) {},
        onAdLoadFailedCallback: (adUnitId, error) {},
        onAdDisplayedCallback: (ad) {},
        onAdDisplayFailedCallback: (ad, error) {
          AppLovinMAX.loadAppOpenAd("YOUR APP OPEN AD UNIT KEY");
        },
        onAdClickedCallback: (ad) {},
        onAdHiddenCallback: (ad) {
          AppLovinMAX.loadAppOpenAd("YOUR APP OPEN AD UNIT KEY");
        },
        onAdRevenuePaidCallback: (ad) {},
      ),
    );
  }




}