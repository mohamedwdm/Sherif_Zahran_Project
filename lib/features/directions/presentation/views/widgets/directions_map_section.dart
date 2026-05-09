import 'package:flutter/material.dart';

class DirectionsMapSection extends StatelessWidget {
  const DirectionsMapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuAg-RH0Dx-WppE3tF0WyTx_k6xSPeQk-aljV3lhS46DVw4cW0wCIlIR0-V-6Hp5ib9lWdJzdSGlgp6thtwpo4UyWkZeDuQGm7tKmlsgiUExXJxBW9-RO3M-VJq4B9oT360ezCn6bedBV1wHiqs2m-rSOUa0w6Ilc_3im1hRLdQfMRwS5JDG4gGtCTjOBuD7I3rwROkr9fNbBAv0byzXTOmXHMXhqPD6NoNLfQm40E6nm2Hghc0Q0Pb5chL0L5byF0wa-UXH-Zf8sAWu"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7A00),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              Container(
                width: 2,
                height: 32,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFF7A00), Colors.transparent],
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
