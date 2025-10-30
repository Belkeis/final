import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class OnlineRequestPage extends StatefulWidget {
  const OnlineRequestPage({Key? key}) : super(key: key);

  @override
  State<OnlineRequestPage> createState() => _OnlineRequestPageState();
}

class _OnlineRequestPageState extends State<OnlineRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'طلبات عبر الإنترنت',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text(
                    'جواز السفر',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'تقدم بطلب الحصول على جواز السفر أو تجديده\nبسهولة وسرعة من خلال هذه الصفحة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DocumentsContainer(
                title: 'الوثائق المطلوبة',
                children: [
                  RequirementItem(text: 'جواز السفر منتهي الصلاحية'),
                  RequirementItem(text: 'بطاقة التسجيل الفصلي سارية المفعول'),
                  RequirementItem(text: 'استمارة طلب مملوءة وموقعة'),
                  RequirementItem(text: 'شهادة ميلاد خاصة أصلية ( 12S )'),
                  RequirementItem(
                    text:
                        'إثبات الإقامة القانونية في الجزائر (حال شهادة\nالعمل أو بطاقة الطالب)',
                  ),
                  RequirementItem(
                    text: 'أربع صور فوتوغرافية حديثة بحجم 35 × 45 مم',
                  ),
                  RequirementItem(
                    text: 'نسخة من بطاقة التعريف الوطنية (إذا كانت\nمتوفرة)',
                  ),
                  RequirementItem(
                    text: 'إيصال دفع رسوم الجواز (حوالي 6000 دج)',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم إرسال الطلب بنجاح'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D26A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'طلب تجديد',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.send, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
