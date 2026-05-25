// import 'package:flutter/material.dart';
// import 'package:user_directory/utils/app_colors.dart';
// import 'package:user_directory/widgets/my_text.dart';

// class UserDetails extends StatefulWidget {
//   const UserDetails({super.key});

//   @override
//   State<UserDetails> createState() => _UserDetailsState();
// }

// class _UserDetailsState extends State<UserDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.surface,
//       body: Column(
//         children: [
//           // First Pannel
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.border),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     AppColors.avatarColors[0].withOpacity(0.3),
//                     AppColors.surface,
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   CircleAvatar(

//                   ),
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: 10),
//           // Second Pannel
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(color: AppColors.surface),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 8.0,
//                   vertical: 16.0,
//                 ),
//                 child: Column(
//                   children: [
//                     // Container(
//                     //   height: 80,
//                     //   width: double.infinity,
//                     //   decoration: BoxDecoration(
//                     //     color: AppColors.avatarColors[0].withOpacity(0.3),
//                     //     border: Border.all(color: AppColors.avatarColors[0]),
//                     //     borderRadius: BorderRadius.circular(8),
//                     //   ),
//                     // ),
//                     // SizedBox(height: 10),
//                     Container(
//                       height: 410,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: AppColors.background,
//                         border: Border.all(color: AppColors.border),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Column(
//                         children: [
//                           detailChip(
//                             icon: Icons.work_outline_outlined,
//                             title: 'COMPANY',
//                             subtiTile: 'Deckcow_Crist',
//                             boxClr: AppColors.avatarColors[0].withOpacity(0.3),
//                             iconClr: const Color(0xFF1D4ED8),
//                           ),
//                           Divider(
//                             height: 1,
//                             thickness: 0.5,
//                             color: AppColors.border,
//                           ),

//                           // Email
//                           detailChip(
//                             icon: Icons.mail_outline,
//                             title: 'Email',
//                             subtiTile: 'john.doe@example.com',
//                             boxClr: AppColors.avatarColors[5].withOpacity(0.14),
//                             iconClr: const Color(0xFF06B6D4),
//                           ),
//                           Divider(
//                             height: 1,
//                             thickness: 0.5,
//                             color: AppColors.border,
//                           ),

//                           //Phone
//                           detailChip(
//                             icon: Icons.phone_outlined,
//                             title: 'Phone',
//                             subtiTile: '+1 (555) 123-4567',
//                             boxClr: AppColors.avatarColors[7].withOpacity(0.14),
//                             iconClr: const Color(0xFF84CC16),
//                           ),
//                           Divider(
//                             height: 1,
//                             thickness: 0.5,
//                             color: AppColors.border,
//                           ),

//                           // Website
//                           detailChip(
//                             icon: Icons.web,
//                             title: 'Website',
//                             subtiTile: 'https://www.decks.com',
//                             boxClr: AppColors.avatarColors[9].withOpacity(0.14),
//                             iconClr: const Color(0xFF6366F1),
//                           ),
//                           Divider(
//                             height: 1,
//                             thickness: 0.5,
//                             color: AppColors.border,
//                           ),

//                           // Address
//                           detailChip(
//                             icon: Icons.location_on_outlined,
//                             title: 'Address',
//                             subtiTile: '123 Main Street, City, State 12345',
//                             boxClr: AppColors.avatarColors[3].withOpacity(0.14),
//                             iconClr: const Color(0xFFF97316),
//                           ),
//                           // Divider(
//                           //   height: 1,
//                           //   thickness: 0.5,
//                           //   color: AppColors.border,
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class detailChip extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtiTile;
//   final Color boxClr;
//   final Color iconClr;
//   const detailChip({
//     super.key,
//     required this.icon,
//     required this.title,
//     required this.subtiTile,
//     required this.boxClr,
//     required this.iconClr,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
//       child: Row(
//         children: [
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               color: boxClr,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(icon, color: iconClr),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MyText(
//                 text: title,
//                 size: 18,
//                 color: AppColors.text,
//                 weight: FontWeight.w600,
//               ),
//               MyText(
//                 text: subtiTile,
//                 size: 16,
//                 color: AppColors.textSecondary,
//                 weight: FontWeight.w400,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:user_directory/model/user_model.dart';
import 'package:user_directory/utils/app_colors.dart';
import 'package:user_directory/widgets/my_text.dart';

class UserDetails extends StatefulWidget {
  final Users user;
  const UserDetails({super.key, required this.user});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            //Hero Panel
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.avatarColors[0].withOpacity(0.10),
                    Colors.white,
                  ],
                ),
              ),
              padding: EdgeInsets.fromLTRB(16, topPad, 16, 20),
              child: Column(
                children: [
                  // Back row
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chevron_left_rounded,
                              color: AppColors.avatarColors[0],
                              size: 22,
                            ),
                            MyText(
                              text: 'Users',
                              size: 14,
                              weight: FontWeight.w500,
                              color: AppColors.avatarColors[0],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      MyText(
                        text: 'Profile',
                        size: 15,
                        weight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                      const Spacer(),
                      const SizedBox(width: 60),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Avatar
                  Stack(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: AppColors.avatarColors[0].withOpacity(0.13),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.avatarColors[0].withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: ClipOval(
                            child: widget.user.image?.isNotEmpty == true
                                ? Image.network(
                                    widget.user.image!,
                                    width: 68,
                                    height: 68,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: MyText(
                                      text:
                                          widget.user.firstName?.isNotEmpty ==
                                              true
                                          ? widget.user.firstName![0]
                                          : '?',
                                      size: 20,
                                      weight: FontWeight.w700,
                                      color: AppColors.avatarColors[0],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 2,
                      //   right: 2,
                      //   child: Container(
                      //     width: 13,
                      //     height: 13,
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xFF10B981),
                      //       shape: BoxShape.circle,
                      //       border: Border.all(color: Colors.white, width: 2.5),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  MyText(
                    text:
                        widget.user.firstName != null &&
                            widget.user.lastName != null
                        ? '${widget.user.firstName} ${widget.user.lastName}'
                        : 'Unknown User',
                    size: 19,
                    weight: FontWeight.w700,
                    color: AppColors.text,
                  ),

                  const SizedBox(height: 3),

                  MyText(
                    text: widget.user.username != null
                        ? '@${widget.user.username}'
                        : '@unknown',
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),

                  // User Role
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: widget.user.role == 'admin'
                          ? const Color(0xFFFEF2F2)
                          : const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: widget.user.role == 'admin'
                            ? const Color(0xFFFCA5A5)
                            : const Color(0xFF93C5FD),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.user.role == 'admin'
                              ? Icons.admin_panel_settings_outlined
                              : Icons.person_outline,
                          size: 13,
                          color: widget.user.role == 'admin'
                              ? const Color(0xFFDC2626)
                              : const Color(0xFF2563EB),
                        ),
                        const SizedBox(width: 5),
                        MyText(
                          text: (widget.user.role ?? 'user').toUpperCase(),
                          size: 11,
                          weight: FontWeight.w600,
                          color: widget.user.role == 'admin'
                              ? const Color(0xFFDC2626)
                              : const Color(0xFF2563EB),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroChip(
                        icon: Icons.location_on_outlined,
                        label: widget.user.address?.city ?? 'Unknown City',
                        bg: const Color(0xFFF0FDF4),
                        border: const Color(0xFFA7F3D0),
                        color: const Color(0xFF065F46),
                      ),
                      const SizedBox(width: 8),
                      HeroChip(
                        icon: Icons.school_outlined,
                        label: widget.user.university ?? 'Unknown University',
                        bg: const Color(0xFFFFFBEB),
                        border: const Color(0xFFFDE68A),
                        color: const Color(0xFF92400E),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Info Panel
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.avatarColors[0].withOpacity(0.08),
                        border: Border.all(
                          color: AppColors.avatarColors[0].withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.avatarColors[0].withOpacity(
                                0.15,
                              ),
                              border: Border.all(
                                color: AppColors.border.withOpacity(0.45),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Icon(
                              Icons.business_rounded,
                              size: 18,
                              color: AppColors.avatarColors[0],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: 'COMPANY',
                                size: 10,
                                weight: FontWeight.w700,
                                color: AppColors.avatarColors[0],
                              ),
                              const SizedBox(height: 2),
                              MyText(
                                text:
                                    widget.user.company?.name ??
                                    'Unknown Company',
                                size: 14,
                                weight: FontWeight.w600,
                                color: AppColors.text,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 13),
                    // Contact info rows card
                    MyText(
                      text: 'CONTACT',
                      size: 12,
                      weight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 5),
                    // Info rows card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          DetailRow(
                            icon: Icons.mail_outline_rounded,
                            label: 'EMAIL',
                            value: widget.user.email ?? 'Unknown Email',
                            boxClr: AppColors.avatarColors[5].withOpacity(0.14),
                            iconClr: const Color(0xFF06B6D4),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.phone_outlined,
                            label: 'PHONE',
                            value: widget.user.phone ?? 'Unknown Phone',
                            boxClr: AppColors.avatarColors[7].withOpacity(0.14),
                            iconClr: const Color(0xFF84CC16),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),

                          // DetailRow(
                          //   icon: Icons.language_rounded,
                          //   label: 'Mac Address',
                          //   value:
                          //       widget.user.macAddress?.toString() ??
                          //       'Unknown Mac Address',
                          //   boxClr: AppColors.avatarColors[9].withOpacity(0.14),
                          //   iconClr: const Color(0xFF6366F1),
                          //   valueColor: const Color(0xFF6366F1),
                          // ),
                          DetailRow(
                            icon: Icons.location_on_outlined,
                            label: 'ADDRESS',
                            value:
                                widget.user.address?.address ??
                                'Unknown Address',
                            boxClr: AppColors.avatarColors[3].withOpacity(0.14),
                            iconClr: const Color(0xFFF97316),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    // Personal info rows card
                    MyText(
                      text: 'PERSONAL',
                      size: 12,
                      weight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 5),
                    // Info rows card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          DetailRow(
                            icon: widget.user.gender == 'male'
                                ? Icons.male
                                : widget.user.gender == 'female'
                                ? Icons.female
                                : Icons.transgender,
                            // color: widget.user.gender == 'male'
                            //     ? Colors.blue
                            //     : widget.user.gender == 'female'
                            //     ? Colors.pink
                            //     : Colors.purple,
                            label: 'GENDER',
                            value: widget.user.gender ?? 'Unknown Gender',
                            boxClr: AppColors.avatarColors[5].withOpacity(0.14),
                            iconClr: const Color(0xFF06B6D4),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.cake_outlined,
                            label: 'AGE',
                            value: widget.user.age?.toString() ?? 'Unknown Age',
                            boxClr: AppColors.avatarColors[7].withOpacity(0.14),
                            iconClr: const Color(0xFF84CC16),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.water_drop_outlined,
                            label: 'Blood Group',
                            value:
                                widget.user.bloodGroup?.toString() ??
                                'Unknown Blood Group',
                            boxClr: AppColors.avatarColors[4].withOpacity(0.14),
                            iconClr: const Color(0xFFEF4444),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.height_outlined,
                            label: 'HEIGHT',
                            value: widget.user.height != null
                                ? '${widget.user.height} cm'
                                : 'Unknown Height',
                            boxClr: AppColors.avatarColors[3].withOpacity(0.14),
                            iconClr: const Color(0xFFF97316),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.monitor_weight_outlined,
                            label: 'WEIGHT',
                            value: widget.user.weight != null
                                ? '${widget.user.weight} kg'
                                : 'Unknown Weight',
                            boxClr: AppColors.avatarColors[1].withOpacity(0.14),
                            iconClr: const Color(0xFF8B5CF6),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    //  Financial info rows card
                    MyText(
                      text: 'FINANCIAL',
                      size: 12,
                      weight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 5),
                    // Info rows card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          DetailRow(
                            icon: widget.user.crypto?.coin != null
                                ? Icons.account_balance_wallet_outlined
                                : Icons.error_outline,
                            label: 'COIN',
                            value: widget.user.crypto?.coin ?? 'Unknown Coin',
                            boxClr: AppColors.avatarColors[20].withOpacity(
                              0.14,
                            ),
                            iconClr: const Color(0xFFCA8A04),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: widget.user.crypto?.network != null
                                ? Icons.hub_outlined
                                : Icons.error_outline,
                            label: 'NETWORK',
                            value:
                                widget.user.crypto?.network ??
                                'Unknown Network',
                            boxClr: AppColors.avatarColors[23].withOpacity(
                              0.14,
                            ),
                            iconClr: const Color(0xFF059669),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.credit_card_outlined,
                            label: 'CARD TYPE',
                            value: widget.user.bank?.cardType ?? 'Unknown Card',
                            boxClr: AppColors.avatarColors[18].withOpacity(
                              0.14,
                            ),
                            iconClr: const Color(0xFF2563EB),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.currency_exchange_outlined,
                            label: 'CURRENCY',
                            value:
                                widget.user.bank?.currency ??
                                'Unknown Currency',
                            boxClr: AppColors.avatarColors[20].withOpacity(
                              0.14,
                            ),
                            iconClr: const Color(0xFFCA8A04),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.event_note_outlined,
                            label: 'CARD EXPIRY',
                            value:
                                widget.user.bank?.cardExpire ??
                                'Unknown Card Expiry',
                            boxClr: AppColors.avatarColors[10].withOpacity(
                              0.14,
                            ),
                            iconClr: const Color(0xFF14B8A6),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                    //  Security info rows card
                    MyText(
                      text: 'DEVICE & NETWORK',
                      size: 12,
                      weight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 5),
                    // Info rows card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        // border: Border.all(color: AppColors.border),
                        border: Border.all(
                          color: AppColors.border.withOpacity(0.45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          DetailRow(
                            icon: widget.user.ip != null
                                ? Icons.router_outlined
                                : Icons.error_outline,
                            label: 'IP',
                            value: widget.user.ip ?? 'Unknown IP',
                            boxClr: AppColors.avatarColors[5].withOpacity(0.14),
                            iconClr: const Color(0xFF06B6D4),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                          DetailRow(
                            icon: Icons.laptop_outlined,
                            label: 'MAC',
                            value:
                                widget.user.macAddress?.toString() ??
                                'Unknown MAC',
                            boxClr: AppColors.avatarColors[7].withOpacity(0.14),
                            iconClr: const Color(0xFF84CC16),
                          ),
                          Divider(
                            height: 1,
                            thickness: 0.4,
                            color: AppColors.border.withOpacity(0.45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Hero Chip

class HeroChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bg;
  final Color border;
  final Color color;

  const HeroChip({
    super.key,
    required this.icon,
    required this.label,
    required this.bg,
    required this.border,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 5),
          MyText(text: label, size: 11, weight: FontWeight.w500, color: color),
        ],
      ),
    );
  }
}

//Detail Row

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color boxClr;
  final Color iconClr;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.boxClr,
    required this.iconClr,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: boxClr,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: iconClr, size: 17),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: label,
                size: 10,
                weight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
              const SizedBox(height: 2),
              MyText(
                text: value,
                size: 13,
                weight: FontWeight.w500,
                color: valueColor ?? AppColors.text,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 15, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          MyText(
            text: title,
            size: 12,
            weight: FontWeight.w700,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
