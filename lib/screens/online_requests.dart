import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_app_bar.dart';
import 'passport_online_request.dart';
import 'id_card_online_request.dart';

class MyOnlineRequestsPage extends StatelessWidget {
  const MyOnlineRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: CustomAppBar(
              onArrowTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              const Text(
                'الطلبات الإلكترونية',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Cairo',
                  color: Color(0xFF2563EB),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'اختر نوع الطلب وأكمل تأكيد معلوماتك\nلتقديمه إلكترونيًا بسهولة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontFamily: 'Cairo',
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),

              // Service Cards
              _buildServiceCard(
                context,
                icon: FontAwesomeIcons.idCard,
                iconColor: const Color(0xFF0381FF),
                iconBgColor: const Color(0xFFDEEAFF),
                title: 'بطاقة تعريف وطنية',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IdRequest(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              
              _buildServiceCard(
                context,
                icon: FontAwesomeIcons.passport,
                iconColor: const Color(0xFF0DA839),
                iconBgColor: const Color(0xFFD1FAE5),
                title: 'جواز سفر',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const onlineRequestPassport(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              
              _buildServiceCard(
                context,
                icon: FontAwesomeIcons.certificate,
                iconColor: const Color(0xFF9C27B0),
                iconBgColor: const Color(0xFFF3E5F5),
                title: 'شهادة ميلاد',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const onlineRequestPassport(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              
              _buildServiceCard(
                context,
                icon: FontAwesomeIcons.heart,
                iconColor: const Color(0xFFE03CBC),
                iconBgColor: const Color(0xFFFCE4EC),
                title: 'عقد زواج',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const onlineRequestPassport(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              
              _buildServiceCard(
                context,
                icon: FontAwesomeIcons.house,
                iconColor: const Color(0xFFDF6F1A),
                iconBgColor: const Color(0xFFFEF3C7),
                title: 'شهادة إقامة',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const onlineRequestPassport(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Reduced padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Container - on the RIGHT in RTL
            Container(
              width: 44, // Slightly reduced size
              height: 44,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: FaIcon(icon, color: iconColor, size: 22), // Slightly smaller icon
              ),
            ),
            const SizedBox(width: 14), // Reduced spacing
            
            // Text Content
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17, // Slightly smaller text
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF111827),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            
            // Arrow Icon
            const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF9CA3AF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}