import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerInfoScreen extends StatelessWidget {
  final String containerAddress;
  final String image;
  final int forecast;
  final int nowContainers;
  final int maxContainers;
  final String event;

  ContainerInfoScreen({
    required this.containerAddress,
    required this.image,
    required this.forecast,
    required this.nowContainers,
    required this.maxContainers,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF79C7FF),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF417DA9),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 22,
          ),
          child: containerInfoCard(containerAddress, image, forecast,
              nowContainers, maxContainers, event),
        ),
      ),
    );
  }

  Widget containerInfoCard(String address, String image, int forecast,
      int nowCont, int maxCont, String event) {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            containerAddressText(address),
            SizedBox(
              height: 6,
            ),
            Divider(
              height: 0,
              thickness: 2,
            ),
            SizedBox(
              height: 12,
            ),
            containerImage(image),
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 42,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      containerInfoTitle('Прогноз заполняемсоти', false),
                      containersForecastInfoText(forecast),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      containerInfoTitle('Количество контейнеров', false),
                      containersAmountInfoText(nowContainers, maxCont),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      containerInfoTitle('Событие', false),
                      containerEventInfoText(event),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerAddressText(String address) {
    return Text(
      address,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'Alice',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  Widget containerStatusText() {
    return Text(
      'Без проишествий',
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'Alice',
        fontWeight: FontWeight.w400,
        color: Color(0xFF818181),
      ),
    );
  }

  Widget containerImage(String image) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget containerInfoTitle(String text, bool isCrush) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Alice',
        color: isCrush ? Color(0xFFEA0000) : Color(0xFF818181),
        fontSize: 12,
      ),
    );
  }

  Widget containersForecastInfoText(int forecast) {
    return Container(
      width: 100,
      child: Text(
        '$forecast ч',
        style: TextStyle(
          fontFamily: 'Alice',
          color: Color(0xFF818181),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget containerEventInfoText(String text) {
    bool isCrush = false;

    if (text.isNotEmpty) isCrush = true;

    return Container(
      width: 100,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Alice',
          color: isCrush ? Color(0xFFEA0000) : Color(0xFF818181),
          fontSize: 12,
        ),
      ),
    );
  }

  Widget containersAmountInfoText(
    int nowCont,
    int maxCont,
  ) {
    bool isCrush = false;

    if (nowCont != maxCont) {
      isCrush = true;
    }
    return Container(
      width: 100,
      child: Text(
        '$nowCont/$maxCont',
        style: TextStyle(
          fontFamily: 'Alice',
          color: isCrush ? Color(0xFFEA0000) : Color(0xFF818181),
          fontSize: 12,
        ),
      ),
    );
  }
}
