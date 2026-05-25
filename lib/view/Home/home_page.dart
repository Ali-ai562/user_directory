import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_directory/model/user_model.dart';
import 'package:user_directory/provider/user_controller.dart';
import 'package:user_directory/utils/app_colors.dart';
import 'package:user_directory/view/user/user_details.dart';
import 'package:user_directory/widgets/my_text.dart';
import 'package:user_directory/view/search/search_field.dart';
import 'package:user_directory/widgets/shimmer_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userCtrl = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    userCtrl.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: const Color(0x1A000000),
        title: MyText(
          text: 'Users',
          weight: FontWeight.w700,
          size: 21,
          color: AppColors.text,
        ),
        centerTitle: false,
        actions: [
          _AppBarIconButton(
            icon: Icons.search_rounded,
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                reverseTransitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => const SearchField(),
                transitionsBuilder: (_, animation, __, child) =>
                    SlideTransition(
                      position:
                          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeOut))
                              .animate(animation),
                      child: child,
                    ),
              ),
            ),
          ),
          _AppBarIconButton(
            icon: Icons.refresh_rounded,
            onTap: () {
              userCtrl.fetchUsers();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
        child: GetBuilder<UserController>(
          builder: (userCtrl) {
            final isLoading = userCtrl.isLoading;
            final users = userCtrl.userModel?.users ?? [];

            //Shimmer while loading
            if (isLoading) {
              return ListView.separated(
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, __) => ShimmerCard(),
              );
            }

            //Empty state
            if (users.isEmpty) {
              return const Center(
                child: MyText(
                  text: 'No users available',
                  size: 15,
                  weight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              );
            }

            //User list
            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final user = users[index];
                return _ProfileCard(user: user);
              },
            );
          },
        ),
      ),
    );
  }
}

//App Bar Icon Button

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AppBarIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, size: 20, color: AppColors.text),
      ),
    );
  }
}

// Profile Card

class _ProfileCard extends StatelessWidget {
  final Users user;

  const _ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: avatar + info + action
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.avatarColors[0].withOpacity(0.14),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.avatarColors[0].withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: user.image?.isNotEmpty == true
                        ? Image.network(
                            user.image!,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: MyText(
                              text: user.firstName?.isNotEmpty == true
                                  ? user.firstName![0]
                                  : '?',
                              size: 20,
                              weight: FontWeight.w700,
                              color: AppColors.avatarColors[0],
                            ),
                          ),
                  ),
                ),

                const SizedBox(width: 13),

                // Name + email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: user.firstName != null && user.lastName != null
                            ? '${user.firstName} ${user.lastName}'
                            : 'Unknown User',
                        size: 17,
                        weight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                      const SizedBox(height: 3),
                      MyText(
                        text: user.email ?? 'No email provided',
                        size: 12,
                        weight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),

                // Open button
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 400),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 400,
                      ),
                      pageBuilder: (_, __, ___) => UserDetails(user: user),
                      transitionsBuilder: (_, animation, __, child) =>
                          SlideTransition(
                            position:
                                Tween(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOut,
                                  ),
                                ),
                            child: child,
                          ),
                    ),
                  ),
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Icon(
                      Icons.open_in_new_rounded,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            Divider(height: 1, thickness: 0.5, color: AppColors.border),
            const SizedBox(height: 12),

            //Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _InfoChip(
                  icon: Icons.work_outline_rounded,
                  label: user.company?.department ?? 'No department',
                  type: _ChipType.blue,
                ),
                _InfoChip(
                  icon: Icons.location_on_outlined,
                  label:
                      user.address?.city != null &&
                          user.address?.country != null
                      ? '${user.address!.city}, ${user.address!.country}'
                      : 'Unknown',
                  type: _ChipType.green,
                ),
                _InfoChip(
                  icon: Icons.schedule_rounded,
                  label: user.company?.title ?? 'No title',
                  type: _ChipType.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Info Chip

enum _ChipType { blue, green, amber }

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final _ChipType type;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.type,
  });

  Color get _bg => switch (type) {
    _ChipType.blue => const Color(0xFFEFF6FF),
    _ChipType.green => const Color(0xFFF0FDF4),
    _ChipType.amber => const Color(0xFFFFFBEB),
  };

  Color get _border => switch (type) {
    _ChipType.blue => const Color(0xFFBFDBFE),
    _ChipType.green => const Color(0xFFA7F3D0),
    _ChipType.amber => const Color(0xFFFDE68A),
  };

  Color get _color => switch (type) {
    _ChipType.blue => const Color(0xFF1D4ED8),
    _ChipType.green => const Color(0xFF065F46),
    _ChipType.amber => const Color(0xFF92400E),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: _color),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: _color,
            ),
          ),
        ],
      ),
    );
  }
}
