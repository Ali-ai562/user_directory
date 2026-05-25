import 'package:flutter/material.dart';
import 'package:user_directory/widgets/my_field.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              MyField(
                hint: 'Search by name',
                onTap: () {},
                onChanged: (value) {
                  // Handle search logic here
                },
                onClear: () {
                  // Handle clear logic here
                },
                icon: Icons.search,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  // This container can be used to display search results
                  // For now, it's just a placeholder
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
