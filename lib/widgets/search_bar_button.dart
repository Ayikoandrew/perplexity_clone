import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchBarButton extends StatefulWidget {
  final IconData icon;
  final String data;
  const SearchBarButton({
    super.key,
    required this.icon,
    required this.data,
  });

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isHover ? AppColors.proButton : AppColors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: AppColors.iconGrey,
            ),
            const SizedBox(width: 8),
            Text(
              widget.data,
              style: const TextStyle(
                color: AppColors.textGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
