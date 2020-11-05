//
//  SettingsPrivacyViewController.swift
//  Joey
//
//  Created by Rahman Fadhil on 02/11/20.
//

import UIKit

let privacyText = """
Developers built the Joey app as a Free app. This App is provided by developer at no cost and is intended for use as is.

This page is used to inform visitors regarding the policies with the collection, use, and disclosure of Personal Information if anyone decided to use this app.

If you choose to use Joey, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the app. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Joey unless otherwise defined in this Privacy Policy.
"""

let privacyInformationAndCollectionUseText = """
For a better experience, while using Joey, we may require you to provide us with certain personally identifiable information, including but not limited to Name, Email, Camera, Pictures. The information that we request will be retained on your device and is not collected by us in any way.
 
As for the face detection, we will detect your face to better understand your emotion that we can see. We will analyze it using our technology but we will not record or save your face in any way.
 
When we introduce facial recognition technology to your experience, we will let you know first and you will have control over our use of this technology for you.
"""

let privacyLogDataText = """
We want to inform you that whenever you use Joey, in a case of an error in the app we collect data and information on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing Joey, the time and date of your use of Joey, and other statistics.
"""

let privacyCookiesText = """
Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

Joey does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this application.
"""

let privacyServiceProvidersText = """
We may employ third-party companies and individuals due to the following reasons:

- To facilitate our Service;
- To provide the Service on our behalf;
- To perform Service-related services; or
- To assist us in analyzing how our Service is used.

We want to inform users of Joey that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.
"""

let privacySecurityText = """
We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.
"""

let privacyLinksToOtherSitesText = """
This application may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.
"""

let privacyChildrensPrivacyText = """
These application do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.
"""

let privacyChangesText = """
We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2020-10-30
"""

let privacyContactUsText = """
If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at joey@gmail.com.
"""

class SettingsPrivacyViewController: UIViewController {

    @IBOutlet weak var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SettingsAccordionTableViewController {
            vc.data = [
                AccordionItem(title: "Our Privacy Policy", content: privacyText),
                AccordionItem(title: "Information Collection and Use", content: privacyInformationAndCollectionUseText),
                AccordionItem(title: "Log Data", content: privacyLogDataText),
                AccordionItem(title: "Cookies", content: privacyCookiesText),
                AccordionItem(title: "Service Providers", content: privacyServiceProvidersText),
                AccordionItem(title: "Security", content: privacySecurityText),
                AccordionItem(title: "Links to Other Sites", content: privacyLinksToOtherSitesText),
                AccordionItem(title: "Children's Privacy", content: privacyChildrensPrivacyText),
                AccordionItem(title: "Changes to This Privacy Policy", content: privacyChangesText),
                AccordionItem(title: "Contact Us", content: privacyContactUsText)
            ]
        }
    }

}
