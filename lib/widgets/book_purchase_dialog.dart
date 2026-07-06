import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPurchaseDialog extends StatelessWidget {
  final String title;
  final Map<String, String> purchaseLinks;

  const BookPurchaseDialog({
    super.key,
    required this.title,
    required this.purchaseLinks,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 550;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Glassmorphic Backdrop blur
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ),
          ),
          
          // Dialog Content Container
          Container(
            width: isDesktop ? 520 : double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with Title and Close Button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.black54),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withValues(alpha: 0.05),
                        hoverColor: Colors.black.withValues(alpha: 0.1),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Thin Divider
                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 20),
                
                Text(
                  'Available Purchase Options',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                
                // Purchase buttons container (Dynamic grid or vertical list)
                isDesktop
                    ? GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3.2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: _buildStoreButtons(),
                      )
                    : Column(
                        children: _buildStoreButtons(verticalSpacing: 12),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStoreButtons({double verticalSpacing = 0}) {
    final List<Widget> buttons = [];
    
    purchaseLinks.forEach((storeName, url) {
      buttons.add(
        _StoreButton(
          storeName: storeName,
          onTap: () => _launchUrl(url),
        ),
      );
      if (verticalSpacing > 0 && buttons.length < purchaseLinks.length) {
        buttons.add(SizedBox(height: verticalSpacing));
      }
    });

    return buttons;
  }
}

class _StoreButton extends StatefulWidget {
  final String storeName;
  final VoidCallback onTap;

  const _StoreButton({
    required this.storeName,
    required this.onTap,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _isHovered = false;

  // Retrieve brand configuration (Color and Icon) dynamically
  Map<String, dynamic> _getBrandConfig() {
    switch (widget.storeName.toLowerCase()) {
      case 'amazon':
        return {
          'color': const Color(0xFFFF9900),
          'icon': Icons.shopping_cart_outlined,
        };
      case 'flipkart':
        return {
          'color': const Color(0xFF2874F0),
          'icon': Icons.local_mall_outlined,
        };
      case 'astitva store':
        return {
          'color': const Color(0xFF8E24AA),
          'icon': Icons.menu_book_outlined,
        };
      case 'classic shelf':
        return {
          'color': const Color(0xFFD4AF37),
          'icon': Icons.bookmark_border_outlined,
        };
      case 'books camel':
        return {
          'color': const Color(0xFF009688),
          'icon': Icons.auto_stories_outlined,
        };
      case 'crown publishers':
        return {
          'color': const Color(0xFF455A64),
          'icon': Icons.publish_outlined,
        };
      case 'google books':
      case 'google play':
        return {
          'color': const Color(0xFFEA4335),
          'icon': Icons.play_arrow_outlined,
        };
      default:
        return {
          'color': const Color(0xFF1E88E5),
          'icon': Icons.open_in_new_outlined,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final brand = _getBrandConfig();
    final Color brandColor = brand['color'] as Color;
    final IconData brandIcon = brand['icon'] as IconData;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? brandColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? brandColor : brandColor.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? brandColor.withValues(alpha: 0.25)
                    : Colors.black.withValues(alpha: 0.02),
                blurRadius: _isHovered ? 12 : 4,
                offset: _isHovered ? const Offset(0, 4) : const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                brandIcon,
                color: _isHovered ? Colors.white : brandColor,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                widget.storeName,
                style: TextStyle(
                  color: _isHovered ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
