import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';

class SpamPolicyScreen extends StatelessWidget {
  const SpamPolicyScreen({super.key});

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
        title: Text(getTranslated(Strings.scam_ploicy,
         context)!, 
         
         style: TextStyle(
        fontWeight: FontWeight.bold
          ),
         
         )
         
         ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Text
          
          
          
          (
            
        getCurrentLang(context)=='en'?
            
            

""" 
Anti-Scam Policy:

At Deals and Business, we are committed to ensuring a fair and transparent environment for all users. Therefore, we work diligently to combat fraud and potential violations of our policies and rules. Here are some measures we take to fight fraud:

1. Activity Monitoring: We regularly monitor activities on the site to detect any signs of fraud or illegal behavior.

2. Data Analysis: We use analytics and data to identify any unusual or unexpected patterns that indicate fraud or violations.

3. Account Restrictions: If any accounts show signs of fraud, we take immediate action to restrict these accounts and prevent access.

4. Internal Investigations: Upon receiving reports of potential violations, we conduct thorough internal investigations to verify the claims and take necessary actions.

5. Awareness Enhancement: We provide users with information and guidance about our policies and rules, encouraging them to report any potential violations promptly.

6. Penalties: We take strict actions against any user involved in fraud, including suspending accounts or permanently banning access to the site.

 

We believe that integrity and transparency are the foundation of our relationship with our users, and we strive to uphold these values by combating fraud through all possible means

"""
            :
            """ 
  

سياسة مكافحة الغش:

نحن في موقع صفقات وأعمال نلتزم بضمان بيئة عادلة وشفافة لجميع المستخدمين. لذا، نعمل بجد لمكافحة الغش والانتهاكات المحتملة لسياساتنا وقواعدنا. إليك بعض الإجراءات التي نتخذها لمكافحة الغش:

1. **مراقبة الأنشطة:** نقوم بمراقبة الأنشطة على الموقع بانتظام للكشف عن أي علامات على الغش أو السلوك غير القانوني.

2. **تحليل البيانات:** نستخدم التحليلات والبيانات لتحديد أي نماذج غير طبيعية أو غير متوقعة تشير إلى الغش أو الانتهاكات.

3. **تقييد الحسابات:** في حالة تحديد أي حسابات تظهر مؤشرات على الغش، نتخذ إجراءات فورية لتقييد هذه الحسابات ومنع الوصول إليها.

4. **التحقيقات الداخلية:** في حالة تلقي تقارير عن أي انتهاكات محتملة، نقوم بإجراء تحقيقات داخلية شاملة للتحقق من الادعاءات واتخاذ الإجراءات اللازمة.

5. **تعزيز التوعية:** نقوم بتوفير معلومات وتوجيهات حول سياساتنا وقواعدنا للمستخدمين، ونشجعهم على الإبلاغ عن أي انتهاكات محتملة بشكل فوري.

6. **العقوبات:** نتخذ إجراءات صارمة ضد أي مستخدم يتورط في الغش، بما في ذلك إيقاف الحسابات أو حظر الوصول للموقع بشكل دائم.

 

نحن نؤمن بأن النزاهة والشفافية هما أساس العلاقة بيننا وبين مستخدمينا، ونعمل جاهدين للحفاظ على هذه القيم بمكافحة الغش بكل الوسائل الممكنة
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