import "package:flutter/material.dart";

class CurrencyCard extends StatelessWidget {
  final String curName, curCode, curAmount;
  final IconData curIcon;
  final Color iconColor, txtColor, bgColor;
  final int order; //놓일 순서
  //아니면 bool isInverted = true해서, 그... isInverted ? 흰색 : 검은색 이렇게 해도 ㅇㅋ

  const CurrencyCard({
    super.key,
    required this.curName,
    required this.curCode,
    required this.curAmount,
    required this.curIcon,
    required this.iconColor,
    required this.txtColor,
    required this.bgColor,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order - 1) * (-20)),
      child: Container(
        clipBehavior: Clip.hardEdge, //오...어떤 아이템이 overflow되었을 때 어떻게 처리할지 설정
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(curName,
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        curAmount,
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        curCode,
                        style: TextStyle(
                          color: txtColor.withAlpha(80),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                //감싸는 card의 변경없이 아이콘만 키우기
                //Transform은 transformation을 전달해준다.
                scale: 2, //2배 크게
                child: Transform.translate(
                  offset: const Offset(8, 10),
                  child: Icon(
                    curIcon,
                    color: iconColor,
                    size: 80,
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
