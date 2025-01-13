// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      alignment: Alignment.center,
      width: isCollapsed ? 64 : 128,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment:
            isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          isCollapsed
              ? Icon(
                  Icons.auto_awesome_mosaic,
                  color: AppColors.whiteColor,
                  size: isCollapsed ? 30 : 60,
                )
              : Center(
                  child: Icon(
                    Icons.auto_awesome_mosaic,
                    color: AppColors.whiteColor,
                    size: 30,
                  ),
                ),
          const SizedBox(height: 24),
          SideBarButton(
            isCollapsed: isCollapsed,
            data: 'Home',
            icon: Icons.add,
          ),
          SideBarButton(
            isCollapsed: isCollapsed,
            data: 'Search',
            icon: Icons.search,
          ),
          SideBarButton(
            isCollapsed: isCollapsed,
            data: 'Language',
            icon: Icons.language,
          ),
          SideBarButton(
            isCollapsed: isCollapsed,
            data: 'Spaces',
            icon: Icons.auto_awesome,
          ),
          SideBarButton(
            isCollapsed: isCollapsed,
            data: 'Library',
            icon: Icons.cloud_outlined,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
