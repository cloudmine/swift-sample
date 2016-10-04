import UIKit
import CloudMine

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let credentials = CMAPICredentials.sharedInstance() as! CMAPICredentials
        credentials.appIdentifier = "c231a674044045af994fa0256007e1cc"
        credentials.apiKey = "9d94c776b4834cd6ba0085da71113a68"

        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }
}

