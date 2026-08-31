import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/app_theme.dart';

class GalleryItem {
  final String code; // e.g. 'A1', 'B2'
  final String imagePath;
  final String title;
  final String description;
  final String category;
  final String sectionLetter;
  final IconData categoryIcon;

  const GalleryItem({
    required this.code,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.category,
    required this.sectionLetter,
    required this.categoryIcon,
  });
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  static const List<GalleryItem> _allItems = [
    // Section A: Academic Lectures & Keynotes
    GalleryItem(
      code: 'A1',
      sectionLetter: 'A',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.27.jpeg',
      title: 'Interactive Clinical Lecture',
      description:
          'Dr. Som conducting an interactive clinical lecture with modern audiovisual aids, training physiotherapy students in contemporary rehabilitation techniques.',
      category: 'Academic Lectures & Keynotes',
      categoryIcon: Icons.school_outlined,
    ),
    GalleryItem(
      code: 'A2',
      sectionLetter: 'A',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.33df.jpeg',
      title: 'Keynote on Muscle & Joint Physiology',
      description:
          'Dr. Som delivering a keynote presentation on joint range of motion, therapeutic conditioning, and advanced muscle physiology for academic scholars.',
      category: 'Academic Lectures & Keynotes',
      categoryIcon: Icons.school_outlined,
    ),
    GalleryItem(
      code: 'A3',
      sectionLetter: 'A',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.3f6.jpeg',
      title: 'TRIHMS Auditorium Address',
      description:
          'Dr. Som addressing delegates and medical scholars from the prestigious podium at Tomo Riba Institute of Health & Medical Sciences (TRIHMS).',
      category: 'Academic Lectures & Keynotes',
      categoryIcon: Icons.school_outlined,
    ),

    // Section B: National Regulatory & Healthcare Policy Summits
    GalleryItem(
      code: 'B1',
      sectionLetter: 'B',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.29dg.jpeg',
      title: 'NCAHP National Council Summit',
      description:
          'Dr. Som participating in the National Commission for Allied and Healthcare Professions (NCAHP) National Council Summit in New Delhi with health ministry leaders.',
      category: 'National Regulatory & Policy Summits',
      categoryIcon: Icons.account_balance_outlined,
    ),
    GalleryItem(
      code: 'B2',
      sectionLetter: 'B',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.35.jpeg',
      title: 'Commission Bilateral Consultation',
      description:
          'Dr. Som engaging in bilateral consultations with national commission leadership at the NCAHP headquarters regarding standardizing physiotherapy curricula.',
      category: 'National Regulatory & Policy Summits',
      categoryIcon: Icons.account_balance_outlined,
    ),
    GalleryItem(
      code: 'B3',
      sectionLetter: 'B',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.36.jpeg',
      title: 'Allied Health Statutory Deliberation',
      description:
          'Dr. Som conferring with national regulatory officials on allied health policies and statutory framework implementation for clinical practice standards.',
      category: 'National Regulatory & Policy Summits',
      categoryIcon: Icons.account_balance_outlined,
    ),

    // Section C: Institutional Leadership & Council Meetings
    GalleryItem(
      code: 'C1',
      sectionLetter: 'C',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.28.jpeg',
      title: 'Academic Council Roundtable',
      description:
          'Dr. Som participating in a high-level academic council discussion alongside institutional leaders, shaping departmental curriculum and clinical initiatives.',
      category: 'Institutional Leadership & Meetings',
      categoryIcon: Icons.groups_outlined,
    ),
    GalleryItem(
      code: 'C2',
      sectionLetter: 'C',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.34.jpeg',
      title: 'Inspection by Hon\'ble Governor',
      description:
          'Dr. Som briefing the then Governor of Arunachal Pradesh, Brig. (Dr.) B. D. Mishra (Retd.), during an official inspection of the clinical rehabilitation facilities.',
      category: 'Institutional Leadership & Meetings',
      categoryIcon: Icons.groups_outlined,
    ),
    GalleryItem(
      code: 'C3',
      sectionLetter: 'C',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.35df.jpeg',
      title: 'Executive Healthcare Boardroom',
      description:
          'Dr. Som presiding at the executive boardroom table with regional healthcare administrators and senior medical delegates for healthcare strategy planning.',
      category: 'Institutional Leadership & Meetings',
      categoryIcon: Icons.groups_outlined,
    ),
    GalleryItem(
      code: 'C4',
      sectionLetter: 'C',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.35sds.jpeg',
      title: 'TRIHMS Healthcare Week Symposium',
      description:
          'Dr. Som honored as a distinguished guest alongside healthcare faculty and students during the annual Healthcare Professionals Week symposium at TRIHMS.',
      category: 'Institutional Leadership & Meetings',
      categoryIcon: Icons.groups_outlined,
    ),

    // Section D: Awards, Honors & Professional Felicitations
    GalleryItem(
      code: 'D1',
      sectionLetter: 'D',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.30.jpeg',
      title: 'World Physical Therapy Day Honor',
      description:
          'Dr. Som receiving an honorary memento and traditional felicitation during the official World Physical Therapy Day celebrations in recognition of excellence.',
      category: 'Awards, Honors & Felicitations',
      categoryIcon: Icons.emoji_events_outlined,
    ),
    GalleryItem(
      code: 'D2',
      sectionLetter: 'D',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.31.jpeg',
      title: '56th National IAP Conference Felicitation',
      description:
          'Dr. Som being felicitated with a floral bouquet and national honor at the 56th Annual Conference of the Indian Association of Physiotherapists (IAP).',
      category: 'Awards, Honors & Felicitations',
      categoryIcon: Icons.emoji_events_outlined,
    ),

    // Section E: Graduations & Campus Community
    GalleryItem(
      code: 'E1',
      sectionLetter: 'E',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.33vf.jpeg',
      title: 'BPT Scholars Convocation',
      description:
          'Dr. Som celebrating convocation day with graduating Bachelor of Physiotherapy (BPT) scholars holding their academic degrees and milestone certificates.',
      category: 'Graduations & Campus Community',
      categoryIcon: Icons.celebration_outlined,
    ),
    GalleryItem(
      code: 'E2',
      sectionLetter: 'E',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.31dsf.jpeg',
      title: 'Student Excursion & Mentorship',
      description:
          'Dr. Som sharing an informal, mentoring moment with university physiotherapy students during an outdoor academic excursion and institutional interaction.',
      category: 'Graduations & Campus Community',
      categoryIcon: Icons.celebration_outlined,
    ),
    GalleryItem(
      code: 'E3',
      sectionLetter: 'E',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.3bvb9.37.jpeg',
      title: 'IGTAMSU Cultural Youth Festival',
      description:
          'Dr. Som presiding over the university cultural youth festival celebrations alongside students in traditional indigenous attire at IGTAMSU University.',
      category: 'Graduations & Campus Community',
      categoryIcon: Icons.celebration_outlined,
    ),

    // Section F: Media, Press & Public Outreach
    GalleryItem(
      code: 'F1',
      sectionLetter: 'F',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.3c6.jpeg',
      title: 'Akashvani All India Radio Broadcast',
      description:
          'Dr. Som recording a public health broadcast at Akashvani (All India Radio) studio, raising awareness about rehabilitation sciences and wellness.',
      category: 'Media, Press & Public Outreach',
      categoryIcon: Icons.mic_external_on_outlined,
    ),
    GalleryItem(
      code: 'F2',
      sectionLetter: 'F',
      imagePath: 'assets/images/WhatsApp Image 2026-07-05 at 07.39.fg37.jpeg',
      title: 'Arunachal Press Club Briefing',
      description:
          'Dr. Som addressing media correspondents at the Arunachal Press Club regarding legal recognition and professional advancement in allied healthcare.',
      category: 'Media, Press & Public Outreach',
      categoryIcon: Icons.mic_external_on_outlined,
    ),
    GalleryItem(
      code: 'F3',
      sectionLetter: 'F',
      imagePath: 'assets/images/WhatsApp Image 2026-08-15 at 08.47.15.jpeg',
      title: '80th Independence Day Celebration',
      description:
          'Dr. Som celebrating the 80th Independence Day with community members, dignitaries, and families during the ceremonial national flag hoisting event.',
      category: 'Media, Press & Public Outreach',
      categoryIcon: Icons.mic_external_on_outlined,
    ),
    GalleryItem(
      code: 'F4',
      sectionLetter: 'F',
      imagePath: 'assets/images/WhatsApp Image 2026-08-15 at 08.47.15z (1).jpeg',
      title: 'Independence Day Flag Ceremony',
      description:
          'Dr. Som joining community representatives and institutional staff gathered around the national flag post in celebration of Independence Day.',
      category: 'Media, Press & Public Outreach',
      categoryIcon: Icons.mic_external_on_outlined,
    ),
  ];

  static const List<String> _categories = [
    'All Moments',
    'Academic Lectures & Keynotes',
    'National Regulatory & Policy Summits',
    'Institutional Leadership & Meetings',
    'Awards, Honors & Felicitations',
    'Graduations & Campus Community',
    'Media, Press & Public Outreach',
  ];

  String _selectedCategory = 'All Moments';

  List<GalleryItem> get _filteredItems {
    if (_selectedCategory == 'All Moments') {
      return _allItems;
    }
    return _allItems.where((item) => item.category == _selectedCategory).toList();
  }

  void _openViewer(List<GalleryItem> currentList, int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Gallery Viewer',
      barrierColor: Colors.black.withValues(alpha: 0.92),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GalleryViewerDialog(
          items: currentList,
          initialIndex: initialIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Group items by category
    final Map<String, List<GalleryItem>> groupedItems = {};
    for (final item in _allItems) {
      groupedItems.putIfAbsent(item.category, () => []).add(item);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Text(
                'Gallery & Moments',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryNavy,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'A curated visual narrative of clinical milestones, academic lectures, national policy summits, and professional leadership.',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 36),

              // Category Filter Pills
              _buildCategorySelector(),
              const SizedBox(height: 48),

              // Display Sections
              if (_selectedCategory == 'All Moments') ...[
                // Grouped view by category
                ...groupedItems.entries.map((entry) {
                  final categoryName = entry.key;
                  final items = entry.value;
                  final sectionLetter = items.first.sectionLetter;
                  final categoryIcon = items.first.categoryIcon;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 56),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Header with Section Letter
                        _buildCategoryHeader(
                          'Section $sectionLetter • $categoryName',
                          categoryIcon,
                          items.length,
                          sectionLetter,
                        ),
                        const SizedBox(height: 24),
                        // Grid for this category
                        _buildGalleryGrid(items),
                      ],
                    ),
                  );
                }),
              ] else ...[
                // Filtered single category view
                _buildCategoryHeader(
                  'Section ${_filteredItems.first.sectionLetter} • $_selectedCategory',
                  _filteredItems.first.categoryIcon,
                  _filteredItems.length,
                  _filteredItems.first.sectionLetter,
                ),
                const SizedBox(height: 24),
                _buildGalleryGrid(_filteredItems),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: _categories.map((cat) {
        final isSelected = _selectedCategory == cat;
        final count = cat == 'All Moments'
            ? _allItems.length
            : _allItems.where((i) => i.category == cat).length;

        return InkWell(
          onTap: () {
            setState(() {
              _selectedCategory = cat;
            });
          },
          borderRadius: BorderRadius.circular(30),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.primaryNavy : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected
                    ? AppTheme.primaryNavy
                    : Colors.grey.withValues(alpha: 0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? AppTheme.primaryNavy.withValues(alpha: 0.2)
                      : Colors.black.withValues(alpha: 0.02),
                  blurRadius: isSelected ? 8 : 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  cat == 'All Moments'
                      ? Icons.grid_view_rounded
                      : _getCategoryIcon(cat),
                  size: 16,
                  color: isSelected ? Colors.white : AppTheme.primaryNavy,
                ),
                const SizedBox(width: 8),
                Text(
                  cat,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppTheme.textDark,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.grey.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Academic Lectures & Keynotes':
        return Icons.school_outlined;
      case 'National Regulatory & Policy Summits':
        return Icons.account_balance_outlined;
      case 'Institutional Leadership & Meetings':
        return Icons.groups_outlined;
      case 'Awards, Honors & Felicitations':
        return Icons.emoji_events_outlined;
      case 'Graduations & Campus Community':
        return Icons.celebration_outlined;
      case 'Media, Press & Public Outreach':
        return Icons.mic_external_on_outlined;
      default:
        return Icons.photo_library_outlined;
    }
  }

  Widget _buildCategoryHeader(
    String title,
    IconData icon,
    int count,
    String sectionLetter,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primaryNavy.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppTheme.primaryNavy, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryNavy,
              letterSpacing: -0.3,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count photos',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryGrid(List<GalleryItem> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        int crossAxisCount = 3;
        if (width < 640) {
          crossAxisCount = 1;
        } else if (width < 960) {
          crossAxisCount = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: width < 640 ? 0.95 : 0.82,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GalleryCard(
              item: item,
              onTap: () => _openViewer(items, index),
            );
          },
        );
      },
    );
  }
}

class GalleryCard extends StatefulWidget {
  final GalleryItem item;
  final VoidCallback onTap;

  const GalleryCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.accentBlue.withValues(alpha: 0.35)
                  : Colors.grey.withValues(alpha: 0.15),
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.black.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: _isHovered ? 20 : 8,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section (Clean, unobstructed image)
                Expanded(
                  flex: 11,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        child: Image.asset(
                          widget.item.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.broken_image,
                                size: 40,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      // Zoom icon indicator on hover
                      AnimatedOpacity(
                        opacity: _isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.2),
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Card Details Section
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          widget.item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryNavy,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Caption with code at the start
                        Expanded(
                          child: RichText(
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 12.5,
                                height: 1.4,
                                color: Colors.grey[700],
                              ),
                              children: [
                                TextSpan(
                                  text: '${widget.item.code}: ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryNavy,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.item.description,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryViewerDialog extends StatefulWidget {
  final List<GalleryItem> items;
  final int initialIndex;

  const GalleryViewerDialog({
    super.key,
    required this.items,
    required this.initialIndex,
  });

  @override
  State<GalleryViewerDialog> createState() => _GalleryViewerDialogState();
}

class _GalleryViewerDialogState extends State<GalleryViewerDialog> {
  late final PageController _pageController;
  late int _currentIndex;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    final total = widget.items.length;
    final currentItem = widget.items[_currentIndex];
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _nextPage();
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _prevPage();
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.escape) {
            Navigator.of(context).pop();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Backdrop & Dismissible Gesture
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.black.withValues(alpha: 0.94)),
              ),
            ),

            // Main Interactive Viewer & PageView
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(
                  left: isDesktop ? 80.0 : 16.0,
                  right: isDesktop ? 80.0 : 16.0,
                  top: 70.0,
                  bottom: 120.0,
                ),
                child: InteractiveViewer(
                  maxScale: 4.0,
                  child: Center(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: total,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              widget.items[index].imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.black45,
                                  child: const Icon(
                                    Icons.broken_image,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            // Top Header: Page Counter & Close Button
            Positioned(
              top: 20,
              left: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page Counter Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(currentItem.categoryIcon, color: Colors.white, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          '${_currentIndex + 1} of $total',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Close Button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 26),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Bottom Overlay: Title & Caption
            Positioned(
              bottom: 24,
              left: isDesktop ? 60 : 16,
              right: isDesktop ? 60 : 16,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.78),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.accentBlue.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                currentItem.category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                currentItem.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              height: 1.45,
                            ),
                            children: [
                              TextSpan(
                                text: '${currentItem.code}: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: currentItem.description,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.95),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Left Navigation Button
            if (_currentIndex > 0)
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 22,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      padding: const EdgeInsets.all(14),
                    ),
                    onPressed: _prevPage,
                  ),
                ),
              ),

            // Right Navigation Button
            if (_currentIndex < total - 1)
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 22,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      padding: const EdgeInsets.all(14),
                    ),
                    onPressed: _nextPage,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
