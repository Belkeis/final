import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'after_req.dart';

class IdRequest extends StatefulWidget {
  const IdRequest({super.key});

  @override
  State<IdRequest> createState() => _IdRequestState();
}

class _IdRequestState extends State<IdRequest> {
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Dialog(
              elevation: 0,
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "تأكيد البيانات الشخصية",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF2563EB),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "يرجى مراجعة معلوماتك لتأكيد هويتك واستكمال الطلب بسهولة.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                        height: 1.5,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _InfoRow("الاسم الكامل:", "أحمد بن يوسف"),
                        _InfoRow("تاريخ الميلاد:", "15/06/2000"),
                        _InfoRow("العنوان:", "ولاية الجزائر، بلدية باب الزوار"),
                        _InfoRow("رقم الهاتف:", "0555 12 34 56"),
                        _InfoRow("البريد الإلكتروني:", "ahmed.benyoussef@email.com"),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _ActionButton(
                            text: "تأكيد ",
                            textColor: Colors.white,
                            background: Color(0xFF2563EB),
                            isConfirm: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ActionButton(
                            text: "إلغاء",
                            textColor: Color(0xFF6B7280),
                            background: Colors.white,
                            shadow: true,
                            isConfirm: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: CustomAppBar(
        onArrowTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    'بطاقة التعريف الوطنية',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'تقدم بطلب الحصول على بطاقة التعريف أو تجديده\nبسهولة وسرعة من خلال هذه الصفحة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F7FF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.description,
                                color: Color(0xFF2563EB),
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'الوثائق المطلوبة',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF2563EB),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _buildRequirement('بطاقة التعريف منتهية الصلاحية'),
                              _buildRequirement(
                                'استمارة طلب مملوءة وموقعة',
                              ),
                              _buildRequirement(
                                  'شهادة ميلاد خاصة أصلية ( 12S )'),
                              _buildRequirement(
                                'إثبات الإقامة القانونية في الجزائر (حال شهادة\nالعمل أو بطاقة الطالب)',
                              ),
                              _buildRequirement(
                                'صورتان فوتوغرافيتان حديثتان بحجم 35 × 45 مم',
                              ),
                              _buildRequirement(
                                'نسخة من بطاقة التعريف الوطنية (إذا كانت\nمتوفرة)',
                              ),
                              _buildRequirement(
                                'إيصال دفع رسوم البطاقة (حوالي 400 دج)',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).padding.bottom + 20,
            ),
            color: Colors.transparent,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => _showConfirmationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00D26A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'طلب تجديد',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.send, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequirement(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6, left: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFF2563EB),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
        textDirection: TextDirection.rtl,
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            color: Color(0xFF111827),
          ),
          children: [
            TextSpan(
              text: "$label ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;
  final bool isConfirm;
  final bool shadow;

  const _ActionButton({
    required this.text,
    required this.textColor,
    required this.background,
    required this.isConfirm,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          if (isConfirm) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AfterReq()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: shadow ? const BorderSide(color: Color(0xFFE5E7EB), width: 1) : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    );
  }
}
