import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final void Function()? decrease;
  final void Function()? increase;

  const CounterWidget({
    super.key,
    this.decrease,
    this.increase,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 90,
          height: 32,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey2,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 30,
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap:decrease,
                        child: Center(
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: increase,
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
