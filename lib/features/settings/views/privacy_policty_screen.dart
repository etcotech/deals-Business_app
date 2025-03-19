import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';

class PrivacyPolictyScreen extends StatelessWidget {
  const PrivacyPolictyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: MyBackButton(
          onTap: (){
        Navigator.pop(context);
          },
        ),
        title: Text(getTranslated(Strings.privacy,
         context)!, 
         
         style: TextStyle(
        fontWeight: FontWeight.bold
          ),
         
         )
         
         ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Text(
                    getCurrentLang(context)=='en'?
                    """
Privacy Policy:

Our Privacy Policy aims to protect the privacy of personal information we receive from users during their use of our website. We are committed to safeguarding the confidentiality and security of personal information and pledge not to share it with external parties without the explicit consent of the users, except in cases permitted by law or when we are required to comply with a court order.

We collect certain personal information voluntarily provided by users, such as names, email addresses, and other contact information given during registration or when placing orders.

We use the personal information we collect solely to provide the services and content requested by users, to improve their experience on the site, and to communicate with them regarding our services and products. We will not use or share personal information for other purposes without the explicit consent of the users.

We follow appropriate security measures to protect personal information from unauthorized access, use, alteration, or disclosure.

We retain personal information only for a limited period, appropriate for the purposes mentioned above, unless there is a legal or regulatory requirement to keep this information for a longer period.

Users have the right at any time to exercise their rights to access the personal information we hold about them, to correct or delete it, or to file a complaint if there are concerns about the use of personal information.

We may update the Privacy Policy from time to time and will post any changes on this page. Users should review the Privacy Policy periodically to stay informed of any changes.
""":
            
            """ 
        
        
        
        سياسة الخصوصية:
        
         
        
        سياسة الخصوصية تهدف إلى حماية خصوصية المعلومات الشخصية التي نتلقاها من المستخدمين أثناء استخدامهم لموقعنا. نحن نلتزم بحماية سرية وأمان المعلومات الشخصية ونتعهد بعدم مشاركتها مع أطراف خارجية دون موافقة صريحة من المستخدمين، إلا في الحالات التي يُسمح بها قانونًا أو يُطلب فيها منا الامتثال لقرار قضائي.
        
         
        
        نحن نقوم بجمع بعض المعلومات الشخصية التي تقدمها المستخدمين بمحض إرادتهم، مثل الاسم، والبريد الإلكتروني، ومعلومات الاتصال الأخرى التي يقدمونها عند التسجيل أو تقديم الطلبات.
        
         
        
        نحن نستخدم المعلومات الشخصية التي نجمعها فقط لتقديم الخدمات والمحتوى المطلوبين من قبل المستخدمين، ولتحسين تجربتهم على الموقع، وللتواصل معهم بشأن خدماتنا ومنتجاتنا. لن نستخدم أو نشارك المعلومات الشخصية لأغراض أخرى دون موافقة صريحة من المستخدمين.
        
         
        
        نحن نتبع إجراءات أمنية مناسبة لحماية المعلومات الشخصية من الوصول غير المصرح به، أو الاستخدام، أو التعديل، أو الإفشاء.
        
         
        
        نحن نحتفظ بالمعلومات الشخصية لفترة زمنية محدودة فقط بما يتناسب مع الأغراض المذكورة أعلاه، ما لم يكن هناك احتياج قانوني أو تنظيمي آخر للحفاظ على هذه المعلومات لفترة أطول.
        
         
        
        يحق للمستخدمين في أي وقت ممارسة حقوقهم في الوصول إلى المعلومات الشخصية التي نحتفظ بها عنهم وتصحيحها أو حذفها، أو تقديم شكوى إذا كانت هناك مخاوف بشأن استخدام المعلومات الشخصية.
        
         
        
        نحن قد نقوم بتحديث سياسة الخصوصية بين الحين والآخر، وسنقوم بنشر أي تغييرات على هذه الصفحة. يتعين على المستخدمين مراجعة سياسة الخصوصية بشكل دوري لمتابعة أي تغييرات.
        
        
        """, 
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 15
          ),
          
          textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}