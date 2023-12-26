import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DisplayBannerAd extends StatefulWidget {
  const DisplayBannerAd({super.key});

  @override
  State<DisplayBannerAd> createState() => _DisplayBannerAdState();
}

class _DisplayBannerAdState extends State<DisplayBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  final adUnitId = 'ca-app-pub-8935754891868419~9204285605';

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_bannerAd != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
          ),
      ],
    );
  }
}
