import 'package:event_flow/helping_widgets/common_gradient_backgroud.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class CommunityScreen extends StatelessWidget {
  final List<Map<String, String>> communities = [
    {
      'name': 'Programmers Arena',
      'url': 'https://www.facebook.com/pa.hstu',
    },
    {
      'name': 'CSE Club of HSTU',
      'url': 'https://www.facebook.com/cseclub.hstu',
    },
    {
      'name': 'IEEE Computer Society HSTU Student Branch Chapter',
      'url': 'https://www.facebook.com/profile.php?id=61565907492071',
    },
  ];

   CommunityScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _showUrl(BuildContext context, String url) {
    // Show a dialog with the URL and a button to open it
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Community URL'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(url),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  _launchURL(url); // Launch the URL when clicked
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Open in Browser'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: gradientBackground(),  // Apply gradient background
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,  // Transparent AppBar
                title: const Text('Community'),
                centerTitle: true,
                elevation: 0,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: communities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),  // Rounded corners for cards
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          communities[index]['name']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF004aad),  // Text color matching theme
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward, color: Color(0xFF6a4bc3)),  // Icon color matching theme
                        onTap: () {
                          _showUrl(context, communities[index]['url']!);  // Show URL dialog on tap
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
