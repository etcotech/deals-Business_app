import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/back_button.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
        title: Text(getTranslated(Strings.faq,
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


1. What is the goal of Deals and Business website?

   - The goal of Deals and Business website is to provide a platform for exchanging investment, real estate, and business project offers, facilitating the search for investment, real estate, and business opportunities for users.

2. How can I register on the website?

   - You can register on the website by visiting the registration page and filling out the required form with your personal information and confirming it.

3. What services are offered on Deals and Business website?

   - Deals and Business website offers services for exchanging investment, real estate, and business project offers among users, as well as providing information and news about the market and investments worldwide.

4. Are there any fees for using the website?

   - No, the website is free to use and does not require any fees for registration or access to the services provided.

5. How can I search for investment, real estate, and business project offers?

   - You can use the search engine available on the website to specify different search criteria and find suitable offers.

6. Can I post an investment or real estate offer on the website?

   - Yes, you can post investment, real estate, and business project offers on the website after registering and following the provided guidelines.

7. What is the privacy policy of Deals and Business website?

   - Please refer to the privacy policy page available on the website to learn all the details related to collecting, using, and protecting personal information.

8. Can I cancel my offer after posting it on the website?

   - Yes, you can cancel your offer at any time by logging into your account and following the specified steps to cancel the offer.

9. How can I contact the website support team?

   - You can contact the website support team through the Contact Us page by filling out the provided form or using the available contact details.

10. Can I file a complaint if I encounter an issue using the website?

   - Yes, you can file a complaint by contacting the website support team and explaining the issue you are facing. The team will work to resolve it as quickly as possible.

11. How can I ensure the success of a business deal?

   - You should have a lawyer or consultant who is aware of all the documents, papers, and contracts before taking any steps. Do not make any financial transfers without getting the green light to do so.

12. What is the commission rate that Deals and Business website charges?

   - Deals and Business website charges a 2% commission for advertising and marketing, which is charged to the advertiser on the website. No commission is charged on real estate products within Saudi Arabia.


"""
:            
            
            """ 
  

بالطبع، إليك الأسئلة المكررة مع إجاباتها:

 

1. **ما هو هدف موقع صفقات وأعمال؟**

   - هدف موقع صفقات وأعمال هو توفير منصة لتبادل عروض الاستثمار والعقارات والمشاريع التجارية، مما يسهل عملية البحث عن فرص استثمارية وعقارية وتجارية للمستخدمين.

2. **كيف يمكنني التسجيل في الموقع؟**

   - يمكنك التسجيل في الموقع عن طريق زيارة صفحة التسجيل وملء النموذج المطلوب بالمعلومات الشخصية وتأكيدها.

3. **ما هي الخدمات المقدمة على موقع صفقات وأعمال؟**

   - يقدم موقع صفقات وأعمال خدمات تبادل العروض الاستثمارية والعقارية والمشاريع التجارية بين المستخدمين، وكذلك توفير معلومات وأخبار حول السوق والاستثمارات في جميع أنحاء العالم

4. **هل هناك رسوم لاستخدام الموقع؟**

   - لا، الموقع مجاني للاستخدام ولا يتطلب أي رسوم للتسجيل أو الوصول إلى الخدمات المقدمة.

5. **كيف يمكنني البحث عن عروض الاستثمار والعقارات والمشاريع التجارية؟**

   - يمكنك استخدام محرك البحث المتوفر على الموقع لتحديد معايير البحث المختلفة والعثور على العروض المناسبة.

6. **هل يمكنني نشر عرض استثماري أو عقاري على الموقع؟**

   - نعم، يمكنك نشر عروض الاستثمار والعقارات والمشاريع التجارية على الموقع بعد التسجيل واتباع الإرشادات المقدمة.

7. **ما هي سياسة الخصوصية لموقع صفقات وأعمال؟**

   - يرجى الرجوع إلى صفحة سياسة الخصوصية المتاحة على الموقع لمعرفة كافة التفاصيل المتعلقة بجمع واستخدام وحماية المعلومات الشخصية.

8. **هل يمكنني إلغاء عرضي بعد نشره على الموقع؟**

   - نعم، يمكنك إلغاء عرضك في أي وقت عن طريق الدخول إلى حسابك ومتابعة الخطوات المحددة لإلغاء العرض.

9. **كيف يمكنني الاتصال بفريق دعم الموقع؟**

   - يمكنك الاتصال بفريق دعم الموقع من خلال صفحة اتصل بنا وملء النموذج المقدم أو استخدام بيانات الاتصال المتاحة.

10. **هل يمكنني تقديم شكوى إذا واجهت مشكلة في استخدام الموقع؟**

   - نعم، يمكنك تقديم شكوى من خلال الاتصال بفريق دعم الموقع وشرح المشكلة التي تواجهها، وسيعمل الفريق على حلها في أسرع وقت ممكن.

11. **كيف أضمن نجاح الصفقه التجارية؟**

- لابد أن يكون لديكم محامي او مستشار ويكون مطلع على جميع المستندات والأوراق والعقود قبل الشروع في اي خطوه ولا تقم باي تحويل مالي إلا بعد أخذ الضوء الاخضر بذالك.

11.**كم النسبه التي يتقاضاها موقع صفقات وأعمال؟**

- يتقاضى موقع صفقات وأعمال ٢% وهذا مقابل الدعاية والإعلان وتكون على المعلن في الموقع 

- لايتم تقاضي اي عمولة على المنتجات العقارية داخل المملكة العربية السعودية


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