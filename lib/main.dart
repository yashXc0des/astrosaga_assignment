

import 'package:astrosagga_assignment/core/routes/app_router.dart';
import 'package:astrosagga_assignment/features/astrologers/data/models/astrologer_model.dart';
import 'package:astrosagga_assignment/features/astrologers/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Text(
          'Error: ${details.exceptionAsString()}',
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  };

  await Hive.initFlutter();
  Hive.registerAdapter(AstrologerModelAdapter());
  await Hive.openBox<AstrologerModel>('astrologers');

  final box = Hive.box<AstrologerModel>('astrologers');
  if (box.isEmpty) {
    box.addAll(getInitialAstrologers());
  }

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroSaga',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0054DC),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(), // ✅ Start from HomeScreen
    );

  }
}
// Generate initial data
List<AstrologerModel> getInitialAstrologers() {
  return [
    AstrologerModel(
      id: '1',
      name: 'Astro Vikram',
      profileImage: 'assets/images/astrologer1.png',
      isOnline: true,
      rating: 4.8,
      experience: 15,
      followers: 2500,
      totalCallTime: '1200 mins',
      totalChatTime: '980 mins',
      profileSummary: 'With 15 years of experience in Vedic astrology, I specialize in providing accurate predictions and guidance for your life\'s important decisions.',
      specialization: 'Expert in Love, Marriage, Career, Business',
      languages: 'Hindi, English, Gujarati',
      images: ['astro1_img1.png', 'astro1_img2.png', 'astro1_img3.png'],
      callRate: '₹20/min',
      originalRate: '₹40/min',
    ),
    AstrologerModel(
      id: '2',
      name: 'Jyotish Sharma',
      profileImage: 'assets/images/astrologer2.png',
      isOnline: false,
      rating: 4.5,
      experience: 12,
      followers: 1800,
      totalCallTime: '950 mins',
      totalChatTime: '750 mins',
      profileSummary: 'Experienced Vedic astrologer with expertise in Nakshatras and Dasha analysis. I can help you navigate through life\'s challenges with cosmic guidance.',
      specialization: 'Expert in Career, Finance, Health',
      languages: 'Hindi, English, Punjabi',
      images: ['astro2_img1.png', 'astro2_img2.png'],
      callRate: '₹15/min',
      originalRate: '₹30/min',
    ),
    AstrologerModel(
      id: '3',
      name: 'Darshana Mourya',
      profileImage: 'assets/images/astrologer6.png',
      isOnline: true,
      rating: 4.9,
      experience: 20,
      followers: 5000,
      totalCallTime: '3500 mins',
      totalChatTime: '2500 mins',
      profileSummary: 'With 20 years of deep practice in astrology, numerology, and vastu shastra, I provide holistic guidance for all aspects of life.',
      specialization: 'Expert in Relationships, Marriage, Vastu',
      languages: 'Hindi, English, Marathi',
      images: ['astro3_img1.png', 'astro3_img2.png', 'astro3_img3.png', 'astro3_img4.png'],
      callRate: '₹25/min',
      originalRate: '₹50/min',
    ),
    AstrologerModel(
      id: '4',
      name: 'Guruji Ashok',
      profileImage: 'assets/images/astrologer4.png',
      isOnline: true,
      rating: 4.7,
      experience: 18,
      followers: 3200,
      totalCallTime: '2800 mins',
      totalChatTime: '1950 mins',
      profileSummary: 'Specializing in Lal Kitab remedies and traditional vedic astrology, I provide practical solutions to life\'s complex problems.',
      specialization: 'Expert in Lal Kitab, Remedies, Business',
      languages: 'Hindi, English, Bhojpuri',
      images: ['astro4_img1.png', 'astro4_img2.png'],
      callRate: '₹22/min',
      originalRate: '₹45/min',
    ),
    AstrologerModel(
      id: '5',
      name: 'Dr. Sunita Jyotish',
      profileImage: 'assets/images/astrologer5.png',
      isOnline: false,
      rating: 4.6,
      experience: 10,
      followers: 1500,
      totalCallTime: '1100 mins',
      totalChatTime: '850 mins',
      profileSummary: 'I combine modern psychological insights with traditional astrological wisdom to provide guidance that resonates with contemporary minds.',
      specialization: 'Expert in Career, Education, Life Purpose',
      languages: 'English, Hindi, Tamil, Telugu',
      images: ['astro5_img1.png', 'astro5_img2.png', 'astro5_img3.png'],
      callRate: '₹18/min',
      originalRate: '₹35/min',
    ),
    AstrologerModel(
      id: '6',
      name: 'Pandit Rajesh',
      profileImage: 'assets/images/astrologer6.png',
      isOnline: true,
      rating: 4.3,
      experience: 8,
      followers: 900,
      totalCallTime: '750 mins',
      totalChatTime: '600 mins',
      profileSummary: 'I specialize in planetary transits and their effects on your daily life. My practical remedies help mitigate negative influences.',
      specialization: 'Expert in Daily Forecasts, Remedies',
      languages: 'Hindi, English',
      images: ['astro6_img1.png', 'astro6_img2.png'],
      callRate: '₹15/min',
      originalRate: '₹30/min',
    ),
    AstrologerModel(
      id: '7',
      name: 'Jyotish Anand',
      profileImage: 'assets/images/astrologer7.png',
      isOnline: false,
      rating: 4.4,
      experience: 9,
      followers: 1200,
      totalCallTime: '900 mins',
      totalChatTime: '700 mins',
      profileSummary: 'Specializing in KP astrology system for precise timing predictions. My goal is to provide accurate guidance for important life decisions.',
      specialization: 'Expert in KP Astrology, Timing, Career',
      languages: 'English, Hindi, Kannada',
      images: ['astro7_img1.png', 'astro7_img2.png'],
      callRate: '₹16/min',
      originalRate: '₹32/min',
    ),
    AstrologerModel(
      id: '8',
      name: 'Neha Vashisht',
      profileImage: 'assets/images/astrologer8.png',
      isOnline: true,
      rating: 4.7,
      experience: 13,
      followers: 2800,
      totalCallTime: '2100 mins',
      totalChatTime: '1800 mins',
      profileSummary: 'I specialize in relationship astrology and compatibility analysis. My compassionate approach helps clients navigate their interpersonal challenges.',
      specialization: 'Expert in Relationships, Compatibility, Marriage',
      languages: 'English, Hindi, Urdu',
      images: ['astro8_img1.png', 'astro8_img2.png', 'astro8_img3.png'],
      callRate: '₹19/min',
      originalRate: '₹38/min',
    ),
    AstrologerModel(
      id: '9',
      name: 'Swami Vishnu',
      profileImage: 'assets/images/astrologer9.png',
      isOnline: true,
      rating: 4.9,
      experience: 25,
      followers: 7500,
      totalCallTime: '5000 mins',
      totalChatTime: '4200 mins',
      profileSummary: 'With 25 years dedicated to spiritual astrology, I help seekers understand their karmic patterns and spiritual life purpose.',
      specialization: 'Expert in Spiritual Guidance, Karma, Past Lives',
      languages: 'Sanskrit, Hindi, English, Bengali',
      images: ['astro9_img1.png', 'astro9_img2.png', 'astro9_img3.png'],
      callRate: '₹30/min',
      originalRate: '₹60/min',
    ),
    AstrologerModel(
      id: '10',
      name: 'Acharya Pradeep',
      profileImage: 'assets/images/astrologer10.png',
      isOnline: false,
      rating: 4.5,
      experience: 14,
      followers: 2200,
      totalCallTime: '1800 mins',
      totalChatTime: '1500 mins',
      profileSummary: 'I combine traditional Jyotish wisdom with practical guidance to help you make the most of planetary influences in your life.',
      specialization: 'Expert in Business, Finance, Property',
      languages: 'Hindi, English, Rajasthani',
      images: ['astro10_img1.png', 'astro10_img2.png'],
      callRate: '₹20/min',
      originalRate: '₹40/min',
    ),
    AstrologerModel(
      id: '11',
      name: 'Dr. Maya Joshi',
      profileImage: 'assets/images/astrologer11.png',
      isOnline: true,
      rating: 4.8,
      experience: 16,
      followers: 3800,
      totalCallTime: '2900 mins',
      totalChatTime: '2500 mins',
      profileSummary: 'With a PhD in astrology and over 16 years of practice, I provide evidence-based astrological guidance for modern individuals.',
      specialization: 'Expert in Career, Education, Life Decisions',
      languages: 'English, Hindi, Malayalam, Tamil',
      images: ['astro11_img1.png', 'astro11_img2.png', 'astro11_img3.png'],
      callRate: '₹25/min',
      originalRate: '₹50/min',
    ),
    AstrologerModel(
      id: '12',
      name: 'Guru Sanjay',
      profileImage: 'assets/images/astrologer12.png',
      isOnline: false,
      rating: 4.6,
      experience: 17,
      followers: 2900,
      totalCallTime: '2300 mins',
      totalChatTime: '1900 mins',
      profileSummary: 'I specialize in Nadi astrology and palmistry. My accurate predictions and practical advice have helped thousands transform their lives.',
      specialization: 'Expert in Nadi Astrology, Palmistry, Remedies',
      languages: 'Tamil, Telugu, English, Hindi',
      images: ['astro12_img1.png', 'astro12_img2.png'],
      callRate: '₹22/min',
      originalRate: '₹45/min',
    ),
  ];
}