import 'package:get/get.dart';
import '../utils/debugs.dart';
import 'ad_loader.dart';

class AdLoaderMediation {
  static interMediation(Function onLoad) {
    if (Debug.adType == Debug.adGoogleType) {
      if (Debug.isAdxEnable) {
        AdLoader.interAdGoogleAdx(() {}, () {
          AdLoader.interAdGoogle(() {}, () {
            AdLoader.interAdFacebook(() {}, () {
              Get.back();

              onLoad.call();
            }, () {
              onLoad.call();
            });
          }, () {
            onLoad.call();
          });
        }, () {
          onLoad.call();
        });
      } else {
        AdLoader.interAdGoogle(() {}, () {
          AdLoader.interAdGoogleAdx(() {}, () {
            AdLoader.interAdFacebook(() {}, () {
              Get.back();

              onLoad.call();
            }, () {
              onLoad.call();
            });
          }, () {
            onLoad.call();
          });
        }, () {
          onLoad.call();
        });
      }
    } else if (Debug.adType == Debug.adFacebookType) {
      AdLoader.interAdFacebook(() {}, () {
        if (Debug.isAdxEnable) {
          AdLoader.interAdGoogleAdx(() {}, () {}, () {
            onLoad.call();
          });
        } else {
          AdLoader.interAdGoogle(() {}, () {
            // Get.back();

            onLoad.call();
          }, () {
            onLoad.call();
          });
        }
      }, () {
        onLoad.call();
      });
    } else {
      onLoad.call();
    }
  }
}
