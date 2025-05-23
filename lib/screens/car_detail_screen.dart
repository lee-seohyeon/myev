import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../models/electric_car.dart';

class CarDetailScreen extends StatelessWidget {
  final ElectricCar car;

  const CarDetailScreen({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.modelName),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.heart),
            onPressed: () {
              // TODO: 즐겨찾기 기능 구현
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 차량 이미지
            if (car.imageUrl != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    image: DecorationImage(
                      image: NetworkImage(car.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

            // 기본 정보
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 브랜드 및 모델명
                  Row(
                    children: [
                      Text(
                        car.brand,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        car.modelName,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 핵심 스펙
                  _buildSpecSection(
                    context: context,
                    title: '핵심 스펙',
                    specs: [
                      SpecItem(
                        icon: LucideIcons.battery,
                        label: '주행거리',
                        value: '${car.range}km',
                      ),
                      SpecItem(
                        icon: LucideIcons.zap,
                        label: '충전시간',
                        value: '${car.chargingTime}분',
                      ),
                      SpecItem(
                        icon: LucideIcons.batteryCharging,
                        label: '배터리',
                        value: '${car.batteryCapacity}kWh',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 가격 정보
                  _buildSpecSection(
                    context: context,
                    title: '가격 정보',
                    specs: [
                      SpecItem(
                        icon: LucideIcons.tag,
                        label: '차량 가격',
                        value: '${car.price}만원',
                      ),
                      SpecItem(
                        icon: LucideIcons.gift,
                        label: '보조금',
                        value: '${car.subsidy}만원',
                      ),
                      SpecItem(
                        icon: LucideIcons.wallet,
                        label: '실구매가',
                        value: '${car.actualPrice}만원',
                        isHighlighted: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 출시일
                  Text(
                    '출시일',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${car.releaseDate.year}년 ${car.releaseDate.month}월',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),

                  // 주요 기능
                  Text(
                    '주요 기능',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: car.features.entries
                        .where((e) => e.value)
                        .map((e) => Chip(
                              label: Text(e.key),
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              side: BorderSide.none,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // 메모 추가 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 메모 추가 기능 구현
          _showMemoDialog(context);
        },
        child: const Icon(LucideIcons.pencil),
      ),
    );
  }

  Widget _buildSpecSection({
    required BuildContext context,
    required String title,
    required List<SpecItem> specs,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: specs.map((spec) => _buildSpecItem(context, spec)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecItem(BuildContext context, SpecItem spec) {
    final textStyle = spec.isHighlighted
        ? Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            )
        : Theme.of(context).textTheme.titleMedium;

    return Column(
      children: [
        Icon(spec.icon),
        const SizedBox(height: 8),
        Text(
          spec.label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          spec.value,
          style: textStyle,
        ),
      ],
    );
  }

  void _showMemoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('메모 추가'),
        content: TextField(
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: '이 차량에 대한 메모를 입력하세요',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          FilledButton(
            onPressed: () {
              // TODO: 메모 저장 기능 구현
              Navigator.pop(context);
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}

class SpecItem {
  final IconData icon;
  final String label;
  final String value;
  final bool isHighlighted;

  const SpecItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isHighlighted = false,
  });
} 