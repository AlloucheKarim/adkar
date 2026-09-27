import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utils.dart';
import '../../core/design_system.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/gratitude_service.dart';
import '../../core/theme_service.dart';
import '../../core/transitions.dart';
import '../../core/app_image_helper.dart';
import 'gratitude_history_screen.dart';

class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({super.key});

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    final todaysEntry = GratitudeService().getTodaysEntry();
    _controller.text = todaysEntry?.content ?? '';
    if (todaysEntry != null && todaysEntry.imagePaths.isNotEmpty) {
      _imagePaths.addAll(todaysEntry.imagePaths);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const int maxPhotos = 3;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _imagePaths.add(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _showImagePickerOptions() {
    if (_imagePaths.length >= maxPhotos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الْحَدُّ الأَقْصَى لِلصُّوَرِ هُوَ 3 صُوَرٍ'),
        ),
      );
      return;
    }
    final isNightMode = ThemeService().isNightMode;
    showModalBottomSheet(
      context: context,
      backgroundColor: isNightMode
          ? const Color(0xFF3E2723)
          : const Color(0xFFFFFDF9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Wrap(
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library_outlined,
                    color: Color(0xFFC09D63),
                  ),
                  title: Text(
                    'الْمَعْرِضُ'.preventOrphan(),
                    style: AppTypography.arabic(fontSize: 18).copyWith(
                      color: isNightMode
                          ? const Color(0xFFF5F5DC)
                          : const Color(0xFF5D4037),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                Divider(color: const Color(0xFFE6C98A).withValues(alpha: 0.2)),
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFFC09D63),
                  ),
                  title: Text(
                    'الْكَامِيرَا'.preventOrphan(),
                    style: AppTypography.arabic(fontSize: 18).copyWith(
                      color: isNightMode
                          ? const Color(0xFFF5F5DC)
                          : const Color(0xFF5D4037),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _removeImage(int index) {
    setState(() {
      _imagePaths.removeAt(index);
    });
  }

  void _save() {
    if (_controller.text.trim().isNotEmpty || _imagePaths.isNotEmpty) {
      GratitudeService().addEntry(
        _controller.text.trim(),
        imagePaths: _imagePaths,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تَمَّ حِفْظُ خَاطِرَتِكِ بِنَجَاحٍ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'رُكْنُ الِامْتِنَانِ'.preventOrphan(),
              style: AppTypography.header(fontSize: 24).copyWith(
                color: isNightMode
                    ? const Color(0xFFF5F5DC)
                    : const Color(0xFF5D4037),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.history),
                color: isNightMode
                    ? const Color(0xFFF5F5DC)
                    : const Color(0xFF5D4037),
                tooltip: 'سِجِلُّ الِامْتِنَانِ',
                onPressed: () {
                  Navigator.push(
                    context,
                    BookPageRoute(page: const GratitudeHistoryScreen()),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ'.preventOrphan(),
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 20).copyWith(
                    color: isNightMode
                        ? const Color(0xFFF5F5DC)
                        : const Color(0xFF8D6E63),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isNightMode
                          ? const Color(0xFF4E342E).withValues(alpha: 0.6)
                          : Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isNightMode ? null : AppColors.premiumShadow,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            maxLines: null,
                            expands: true,
                            textAlign: TextAlign.center,
                            style: AppTypography.arabic(fontSize: 22).copyWith(
                              color: isNightMode
                                  ? const Color(0xFFF5F5DC)
                                  : AppColors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              hintText: 'اكْتُبِي هُنَا...',
                              hintStyle: AppTypography.arabic(fontSize: 22).copyWith(
                                color: isNightMode
                                    ? const Color(0xFFF5F5DC).withValues(alpha: 0.5)
                                    : Colors.grey,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        if (_imagePaths.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 90,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _imagePaths.length,
                              itemBuilder: (ctx, idx) {
                                final path = _imagePaths[idx];
                                return Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 8, top: 6, right: 6),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: const Color(0xFFE6C98A),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: AppImageHelper.buildWidget(
                                        path,
                                        width: 80,
                                        height: 80,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () => _removeImage(idx),
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: const BoxDecoration(
                                            color: Colors.redAccent,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: _showImagePickerOptions,
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Color(0xFFC09D63),
                        size: 20,
                      ),
                      label: Text(
                        _imagePaths.isEmpty
                            ? 'إِضَافَةُ صُورَةٍ'
                            : 'إِضَافَةُ صُورَةٍ (${_imagePaths.length}/$maxPhotos)',
                        style: AppTypography.arabic(fontSize: 16).copyWith(
                          color: const Color(0xFFC09D63),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE6C98A), width: 1.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _save,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE6C98A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        'حِفْظٌ',
                        style: AppTypography.header(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
