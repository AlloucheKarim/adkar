import 'package:flutter/material.dart';

class ContactIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ContactIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE6C98A), width: 1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF8D6E63), size: 24),
      ),
    );
  }
}

class LinkRow extends StatelessWidget {
  final String? label;
  final String link;
  final IconData icon;
  final VoidCallback onCopy;
  final bool isNightMode;
  final bool isCentered;

  const LinkRow({
    super.key,
    this.label,
    required this.link,
    required this.icon,
    required this.onCopy,
    required this.isNightMode,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isNightMode
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: isCentered
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC09D63), size: 24),
          const SizedBox(width: 12),
          if (isCentered)
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  link,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: isNightMode ? Colors.white70 : Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Text(
                      label!,
                      style: const TextStyle(
                        fontFamily: 'NotoNaskhArabic',
                        fontSize: 12,
                        color: Color(0xFFC09D63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    link,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: isNightMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.copy_rounded,
              size: 20,
              color: Color(0xFFC09D63),
            ),
            onPressed: onCopy,
            tooltip: 'نَسْخ',
          ),
        ],
      ),
    );
  }
}
