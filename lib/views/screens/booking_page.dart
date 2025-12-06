import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'booking_calendar_screen.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onArrowTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF3B82F6),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.event_available,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'احجز موعدك',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'Cairo',
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'اختر نوع الخدمة المطلوبة',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 50),

            // Service Cards
            ServiceCard(
              title: 'الحالة المدنية',
              subtitle: 'استخراج وثائق الحالة المدنية',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingCalendarScreen(
                      serviceId: 1,
                      bookingTypeId: 1, // NEW: Pass booking type ID
                      serviceTitle: 'الحالة المدنية',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ServiceCard(
              title: 'المصالح البيومترية',
              subtitle: 'خدمات البصمة والبيانات البيومترية',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingCalendarScreen(
                      serviceId: 2,
                      bookingTypeId: 2, // NEW: Pass booking type ID
                      serviceTitle: 'المصالح البيومترية',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ServiceCard(
              title: 'الاستلام',
              subtitle: 'استلام الوثائق الجاهزة',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingCalendarScreen(
                      serviceId: 3,
                      bookingTypeId: 3, // NEW: Pass booking type ID
                      serviceTitle: 'الاستلام',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF111827),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                subtitle,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
