import 'package:flutter/material.dart';

class MyField extends StatefulWidget {
  final String? label;
  final String hint;
  final VoidCallback onTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final IconData? icon;
  final bool openBoard;

  const MyField({
    super.key,
    required this.hint,
    required this.onTap,
    this.onClear,
    this.controller,
    this.label,
    this.icon,
    this.openBoard = false,
    this.onChanged,
  });

  @override
  State<MyField> createState() => _MyFieldState();
}

class _MyFieldState extends State<MyField> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    if (!mounted) return; // 🔥 FIX CRASH

    final hasText = _controller.text.isNotEmpty;

    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }

    widget.onChanged?.call(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange); // 🔥 IMPORTANT
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),

        const SizedBox(height: 5),

        Card(
          elevation: 6,
          child: TextField(
            controller: _controller,
            readOnly: widget.openBoard, // FIXED (logical now)

            style: const TextStyle(color: Color(0xFF1A1A1A), fontSize: 15),
            cursorColor: const Color(0xFF1A1A1A),

            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.25),
                fontSize: 14,
              ),

              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: Colors.black.withOpacity(0.4),
                      size: 20,
                    )
                  : null,

              suffixIcon: _hasText
                  ? IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.black.withOpacity(0.3),
                        size: 18,
                      ),
                      onPressed: _clear,
                    )
                  : null,

              filled: true,
              fillColor: Colors.white,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
                // borderSide: const BorderSide(
                //   color: Color(0xFFE0DDD7),
                //   width: 1.5,
                // ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
                // borderSide: const BorderSide(
                //   color: Color(0xFFE0DDD7),
                //   width: 1.5,
                // ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),

            onTap: widget.onTap,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
