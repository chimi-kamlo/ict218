[
Positioned(
top: 50,
left: 20,
child: CircleAvatar(
radius: 50,
backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
),
),
Positioned(
top: 100,
left: 150,
child: Text(
'John Doe',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight```dart
import 'package:flutter/material.dart';

class TikTokProfile extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
body: Column(
children: [
Container(
height: 200,
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('assets/images/profile_background.jpg'),
fit: BoxFit.cover,
)),
),
),
],
),
),
SizedBox(height: 20),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Column(
children: [
Text(
'10',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),style: TextStyle(
fontSize: 16,
color: Colors.grey,
),
),
],
),
Column(
children: [
Text(
'500',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 5),
Text(
'Fo
SizedBox(height: 5fontSize: 16,
color: Colors.grey,
),
),
],
),
Column(
children: [
Text(
'200',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 5),
Text(
'Following',
style: TexColors.grey,
),
),
],
),
],
),
SizedBox(height: 20),
Expanded(
child: GridView.count(
crossAxisCount: 3,
children: List.generate(
9,
(index) => Container(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('assets/images/video_${index + 1}.jpg'),
fit: BoxF),
),
),
),
],
),
);
}
}
```