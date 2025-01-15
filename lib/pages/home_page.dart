import 'package:flutter/material.dart';
import 'package:perplexity_clone/services/chat_web_services.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ChatWebServices().connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const SideBar(),
        Expanded(
          child: Column(
            children: [
              const Expanded(
                child: SearchSection(),
              ),

              // StreamBuilder(
              //     stream: ChatWebServices().contentStream,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //       fullResponse += snapshot.data?['data'] ?? '';
              //       return Text(fullResponse);
              //     }),
              // footer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Pro',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Enterprise',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Store',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Careers',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'English (English)',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.footerGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
