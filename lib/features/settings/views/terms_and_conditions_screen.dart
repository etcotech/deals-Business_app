import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

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
        title: Text(getTranslated(Strings.terms,
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
1. Terms of Use:
   - Define the terms and rules that users must adhere to while using the platform.
   - Clarify acceptable and unacceptable behaviors on the site.
2. Privacy Policy:
   - Explain how users' personal information is collected, used, and protected.
   - Clarify policies regarding cookies and other technologies used.
3. Intellectual Property Rights:
   - Define the intellectual property rights for the content on the site and ensure they are not violated.
4. Liability:
   - Define liability for damage or loss that users may experience while using the platform.
5. Legal Notice:
   - Clarify the laws governing the use of the site and dispute resolution.
   - Mention the court or authority that any legal disputes are subject to.
6. Indemnities:
   - Define the indemnities that users must provide in case they violate any terms and rules.
7. Legal Notices:
   - Specify how users will be informed of any changes to the terms and rules.
8. Cancellation and Modification:
   - Reserve the right to cancel or modify any part of the terms and rules without prior notice.
9. Business Details:
   - Include information about the company and contact details for any inquiries or concerns.
10. Final Provision:
    - Specify that continued use of the platform constitutes acceptance of the terms and rules.

""":
            
            
            """ 
        
        
1. **شروط الاستخدام:**
   - تحديد الشروط والقواعد التي يجب على المستخدمين الالتزام بها أثناء استخدام المنصة.
   - توضيح السلوكيات المقبولة وغير المقبولة على الموقع.
2. **سياسة الخصوصية:**
   - شرح كيفية جمع واستخدام وحماية المعلومات الشخصية للمستخدمين.
   - توضيح سياسات الارتباط والملفات المؤقتة (الكوكيز) وغيرها من التقنيات المستخدمة.
 
3. **حقوق الملكية الفكرية:**
   - تحديد حقوق الملكية الفكرية للمحتوى الموجود على الموقع وضمان عدم انتهاكها.
4. **المسؤولية:**
   - تحديد المسؤولية عن الضرر أو الخسارة التي يمكن أن يتعرض لها المستخدمون أثناء استخدام المنصة.
5. **إشعار قانوني:**
   - توضيح القوانين التي تنظم استخدام الموقع وحل النزاعات.
   - ذكر المحكمة أو السلطة التي تخضع لها أي نزاعات قانونية.
6. **تعويضات:**
   - تحديد التعويضات التي يجب على المستخدم تقديمها في حالة انتهاكهم لأي من الشروط والقواعد.
7. **الإشعارات القانونية:**
   - تحديد كيفية إبلاغ المستخدمين بأي تغييرات في الشروط والقوانين.
8. **الإلغاء والتعديل:**
   - الحق في إلغاء أو تعديل أي جزء من الشروط والقواعد دون إشعار مسبق.
9. **التفاصيل التجارية:**
   - تضمين معلومات حول الشركة والاتصال بها لتوضيح أي استفسارات أو مخاوف.
10. **التنصيص النهائي:**
    - تحديد أن الاستخدام المستمر للمنصة يعتبر موافقة على الشروط والقواعد.

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