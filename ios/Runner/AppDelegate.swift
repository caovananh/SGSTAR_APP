import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  FirebaseApp.configure()
    var flutter_native_splash = 1
    UIApplication.shared.isStatusBarHidden = false
    GMSServices.provideAPIKey("AIzaSyBOi4nvFYvlQbMD8d_yQD8fUmeNH3ljftg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}