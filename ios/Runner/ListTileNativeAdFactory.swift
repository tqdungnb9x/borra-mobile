// TODO: Import google_mobile_ads
import google_mobile_ads

// TODO: Implement ListTileNativeAdFactory
class ListTileNativeAdFactory : FLTNativeAdFactory {

    func createNativeAd(_ nativeAd: GADNativeAd,
                        customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("ListTileNativeAdView", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView
        let likeCountRandom = String(randomInt(min: 400, max: 999))
        let str = String(randomInt(min: 10000, max: 70000))
        (nativeAdView.priceView as! UILabel).text = likeCountRandom
        let slice1 = str[str.startIndex..<str.index(str.startIndex, offsetBy: 2)]
        let slice2 = str[str.index(str.startIndex, offsetBy: 2)...]
        (nativeAdView.storeView as! UILabel).text = String(slice1) + "," + String(slice2)
        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline

        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil

        (nativeAdView.iconView as! UIImageView).image = nativeAd.icon?.image
        nativeAdView.iconView!.isHidden = nativeAd.icon == nil

        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
    func randomInt(min : Int, max : Int) -> Int {
        return Int.random(in: min..<max)
    }

}
