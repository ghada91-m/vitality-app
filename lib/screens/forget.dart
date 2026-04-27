import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  void sendResetLink() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Reset link sent to your email"),
        backgroundColor: Color(0xFF0B7A3B),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF0B7A3B),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Vitality",
                      style: TextStyle(
                        color: Color(0xFF0B7A3B),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 34),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9CF2B3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "SECURITY CENTER",
                    style: TextStyle(
                      color: Color(0xFF0B7A3B),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  "Reset your",
                  style: TextStyle(
                    fontSize: 34,
                    height: 1.05,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1F2D2A),
                  ),
                ),

                const Text(
                  "access",
                  style: TextStyle(
                    fontSize: 34,
                    height: 1.05,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0B7A3B),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "Enter the email address associated with your Vitality account to receive a secure recovery link.",
                  style: TextStyle(
                    color: Color(0xFF6F7D76),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 34),

                const Text(
                  "EMAIL ADDRESS",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF6F7D76),
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "hello@organic-living.com",
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xFF9DA8A2),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFEFF3F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B7A3B),
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor:
                      const Color(0xFF0B7A3B).withValues(alpha: 0.35),
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send Reset Link",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 46),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 130,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              color: Color(0xFF0B7A3B),
                              size: 26,
                            ),
                            Spacer(),
                            Text(
                              "Secure end-to-end encryption for your privacy.",
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.35,
                                color: Color(0xFF5F6F68),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withValues(alpha: 0.16),
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 38),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Need more help? ",
                        style: TextStyle(
                          color: Color(0xFF7C8A84),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: "Contact Support",
                            style: TextStyle(
                              color: Color(0xFF0B7A3B),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}