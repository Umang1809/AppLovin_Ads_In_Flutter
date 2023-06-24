import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class RewardedAds extends StatefulWidget {
  const RewardedAds({super.key});

  @override
  State<RewardedAds> createState() => _RewardedAdsState();
}

class _RewardedAdsState extends State<RewardedAds> {
  int clickCounter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppLovinMAX.loadRewardedAd("39c6c6cce9bcf4fb");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APP LOVIN REWARDED ADs"),
          centerTitle: true,
          elevation: 10,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        body:  Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  showRewardedAdifRedy();
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
                    showRewardedAdifRedy();
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
                  showRewardedAdifRedyWithoutListener();
                  AppLovinMAX.setRewardedAdListener(
                    RewardedAdListener(
                      onAdLoadedCallback: (ad) {

                      },
                      onAdLoadFailedCallback: (adUnitId, error) {

                        AppLovinMAX.loadRewardedAd("39c6c6cce9bcf4fb");

                      },
                      onAdDisplayedCallback: (ad) {

                      },
                      onAdDisplayFailedCallback: (ad, error) {

                      },
                      onAdClickedCallback: (ad) {

                      },
                      onAdHiddenCallback: (ad) {
                        print("================[Close Button Clicked]================");
                      },
                      onAdReceivedRewardCallback: (ad, reward) {
                        print("================[RECIVED REWARD $reward]================");
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("YOU WON REWARD"),
                            actions: [TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("OK"))],
                          );
                        },);
                      },
                    ),
                  );

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
  Future<void> showRewardedAdifRedy() async {
    bool isReady = (await AppLovinMAX.isRewardedAdReady("39c6c6cce9bcf4fb"))!;
    if (isReady) {
      AppLovinMAX.showRewardedAd("39c6c6cce9bcf4fb");
      RewardedAdListenerr();
    } else {
      showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()));
      AppLovinMAX.loadInterstitial("f645948c75451411");
      await Future.delayed(Duration(seconds: 3)).whenComplete(() async {
        bool isReady = (await AppLovinMAX.isRewardedAdReady("39c6c6cce9bcf4fb"))!;
        if (isReady) {
          Navigator.pop(context);
          AppLovinMAX.showRewardedAd("39c6c6cce9bcf4fb");
          RewardedAdListenerr();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something wents wrong")));
          Navigator.pop(context);
        }
      });
    }
  }
  void RewardedAdListenerr() {
    AppLovinMAX.setRewardedAdListener(
      RewardedAdListener(
        onAdLoadedCallback: (ad) {

        },
        onAdLoadFailedCallback: (adUnitId, error) {

            AppLovinMAX.loadRewardedAd("39c6c6cce9bcf4fb");

        },
        onAdDisplayedCallback: (ad) {

        },
        onAdDisplayFailedCallback: (ad, error) {

        },
        onAdClickedCallback: (ad) {

        },
        onAdHiddenCallback: (ad) {

        },
        onAdReceivedRewardCallback: (ad, reward) {

        },
      ),
    );
  }

  Future<void> showRewardedAdifRedyWithoutListener() async {
    bool isReady = (await AppLovinMAX.isInterstitialReady("39c6c6cce9bcf4fb"))!;
    if (isReady) {
      AppLovinMAX.showRewardedAd("39c6c6cce9bcf4fb");
    } else {
      showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()));
      AppLovinMAX.loadInterstitial("39c6c6cce9bcf4fb");
      await Future.delayed(Duration(seconds: 3)).whenComplete(() async {
        bool isReady =
        (await AppLovinMAX.isRewardedAdReady("39c6c6cce9bcf4fb"))!;
        if (isReady) {
          Navigator.pop(context);
          AppLovinMAX.showRewardedAd("39c6c6cce9bcf4fb");
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something wents wrong")));
          Navigator.pop(context);
        }
      });
    }
  }
}
