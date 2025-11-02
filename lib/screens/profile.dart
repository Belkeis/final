import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF9FAFB),
        //  AppBar 
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(76),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF2563EB),
            ),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 20,
              right: 20,
              bottom: 16,
            ),
            child: Stack(
              children: [
                //  "تعديل" on LEFT
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'تعديل',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                //  Profile title in CENTER
                Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'الملف الشخصي',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                  // Arrow on RIGHT pointing right
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // Navigate to HomePage 
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),


        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  User Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(height: 12),

              //  User Name
              const Text(
                'اسم المستخدم',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 40),

              //  Personal Details Section
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              Container(
                padding: EdgeInsets.all(20),
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
                    _buildInfoRow(
                      icon: Icons.badge,
                      label: 'رقم الهوية',
                      value: '****-****-1234',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.cake,
                      label: 'تاريخ الميلاد',
                      value: 'August 15, 1988',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //  Contact Information Section
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'معلومات الاتصال',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: EdgeInsets.all(20),
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
                    _buildInfoRow(
                      icon: Icons.email,
                      label: 'البريد الإلكتروني',
                      // 🔧 EDITED: Changed to Gmail
                      value: 'example@gmail.com',
                      hasVerification: true,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.phone,
                      label: 'الهاتف',
                      // 🔧 EDITED: Changed to Algerian number format (reversed for RTL)
                      value: '456 123 555 213+',
                      hasVerification: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //  Address Section
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'العنوان',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: EdgeInsets.all(20),
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
                child: _buildInfoRow(
                  icon: Icons.location_on,
                  label: 'العنوان المسجل',
                  value: 'حي البدر، الجزائر العاصمة، الجزائر',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool hasVerification = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 24,
            color: const Color(0xFF2563EB),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  if (hasVerification)
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF059669),
                      size: 18,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
