import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // List of 18 images from assets/images
  final List<String> _images = const [
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.27.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.28.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.29.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.29dg.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.30.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.31.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.31dsf.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.33df.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.33vf.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.34.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.35.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.35df.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.35sds.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.36.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.3c6.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.3f6.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.39.fg37.jpeg',
    'assets/images/WhatsApp Image 2026-07-05 at 07.3bvb9.37.jpeg',
  ];

  void _openViewer(int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Gallery Viewer',
      barrierColor: Colors.black.withValues(alpha: 0.9),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GalleryViewerDialog(
          images: _images,
          initialIndex: initialIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Gallery & Moments', style: theme.textTheme.displayMedium),
              const SizedBox(height: 16),
              Text(
                'A visual showcase of certifications, academic events, clinical milestones, and professional highlights.',
                style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 48),
              
              // Image Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 280,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return GalleryCard(
                    imagePath: _images[index],
                    onTap: () => _openViewer(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GalleryCard extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GalleryCard({
    super.key,
    required this.imagePath,
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
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          child: AnimatedPhysicalModel(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            elevation: _isHovered ? 12 : 3,
            color: Colors.white,
            shadowColor: Colors.black.withValues(alpha: 0.25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.imagePath,
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    color: _isHovered
                        ? Colors.black.withValues(alpha: 0.1)
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryViewerDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryViewerDialog({
    super.key,
    required this.images,
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
    if (_currentIndex < widget.images.length - 1) {
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
    // Focus the node automatically for keyboard navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });

    final total = widget.images.length;
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
            // Interactive View with PageView
            GestureDetector(
              onTap: () => Navigator.of(context).pop(), // Tap outside to close
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 80.0 : 16.0,
                    vertical: 60.0,
                  ),
                  child: InteractiveViewer(
                    maxScale: 4.0,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 4 / 3, // Standard photography aspect ratio
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
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  widget.images[index],
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
              ),
            ),

            // Top Header: Close Button and Page Counter
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page Counter
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_currentIndex + 1} of $total',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Close Button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.6),
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Left Navigation Arrow (Desktop/Swipe helper)
            if (_currentIndex > 0)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.6),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: _prevPage,
                  ),
                ),
              ),

            // Right Navigation Arrow (Desktop/Swipe helper)
            if (_currentIndex < total - 1)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.6),
                      padding: const EdgeInsets.all(16),
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
