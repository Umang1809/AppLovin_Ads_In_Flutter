import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({super.key});

  @override
  State<BannerAds> createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
bool isLoad=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppLovinMAX.createBanner("ec89b8a64bf1e189", AdViewPosition.centered);
    GetLoader();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APP LOVIN BANNER ADs"),
          centerTitle: true,
          elevation: 10,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        body: Center(
          child: isLoad?CircularProgressIndicator():Column(
            children: [
              SizedBox(height: 100,),
              MaxAdView(
                  adUnitId: "ec89b8a64bf1e189",
                  adFormat: AdFormat.banner,
                  listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                  }, onAdLoadFailedCallback: (adUnitId, error) {

                  }, onAdClickedCallback: (ad) {

                  }, onAdExpandedCallback: (ad) {

                  }, onAdCollapsedCallback: (ad) {

                  })
              ),
              SizedBox(height: 100,),
              MaxAdView(
                  adUnitId: "ec89b8a64bf1e189",
                  adFormat: AdFormat.banner,
                  isAutoRefreshEnabled: false,
                  listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                  }, onAdLoadFailedCallback: (adUnitId, error) {

                  }, onAdClickedCallback: (ad) {

                  }, onAdExpandedCallback: (ad) {

                  }, onAdCollapsedCallback: (ad) {

                  })
              ),
              SizedBox(height: 100,),
              MaxAdView(
                  adUnitId: "ec89b8a64bf1e189",
                  adFormat: AdFormat.banner,
                  listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                  }, onAdLoadFailedCallback: (adUnitId, error) {

                  }, onAdClickedCallback: (ad) {

                  }, onAdExpandedCallback: (ad) {

                  }, onAdCollapsedCallback: (ad) {

                  })
              ),
              SizedBox(height: 100,),
              MaxAdView(
                  adUnitId: "ec89b8a64bf1e189",
                  adFormat: AdFormat.banner,
                  listener: AdViewAdListener(onAdLoadedCallback: (ad) {

                  }, onAdLoadFailedCallback: (adUnitId, error) {

                  }, onAdClickedCallback: (ad) {

                  }, onAdExpandedCallback: (ad) {

                  }, onAdCollapsedCallback: (ad) {

                  })
              ),
              SizedBox(height: 150,),
              Text("Banner Ad take some times to be loaded, please wait...",)
            ],
          ),
        ),
      ),
    );
  }

  void GetLoader() async {
    await Future.delayed(Duration(seconds: 3)).whenComplete(() {
      setState(() {
        isLoad=false;
      });
    });
  }
}
