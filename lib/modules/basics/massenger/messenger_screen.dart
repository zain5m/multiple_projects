import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/34492145?v=4'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.edit,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 15.0),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 98,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buidStoeyItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buidChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemCount: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buidChatItem() => Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            // alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/34492145?v=4'),
                radius: 30.0,
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 7.0,
                        width: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text('2:32 pm.'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget buidStoeyItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              // alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/34492145?v=4'),
                  radius: 30.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Zain Mhesn sdlmoadsjcids',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}

// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4',
// ),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// SizedBox(width: 20.0),
// Container(
// width: 60.0,
// child: Column(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 6.0,
// ),
// Text(
// 'Zain Mhesn sdlmoadsjcids',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// Expanded(
// child: SingleChildScrollView(
// child: Column(
// children: [
// SizedBox(height: 30.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: 20.0),
// Row(
// children: [
// Stack(
// alignment: Alignment.bottomRight,
// // alignment: AlignmentDirectional.bottomEnd,
// children: [
// CircleAvatar(
// backgroundImage: NetworkImage(
// 'https://avatars.githubusercontent.com/u/34492145?v=4'),
// radius: 30.0,
// ),
// Padding(
// padding: const EdgeInsetsDirectional.only(
// bottom: 3.0, end: 3.0),
// child: CircleAvatar(
// radius: 7.0,
// backgroundColor: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// width: 20,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Zaidskdskdskdkdkdkdkdsksddskkn mhesnddsssdssddsdsdsds',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 16.0,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5.0,
// ),
// Row(
// children: [
// Expanded(
// child: Text(
// ';cdsdjskdddjdjdsjdsjjdsdsdsjjdszdldsodododododk ddd sdsd ss',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10.0),
// child: Container(
// height: 7.0,
// width: 7.0,
// decoration: BoxDecoration(
// color: Colors.blue,
// shape: BoxShape.circle,
// ),
// ),
// ),
// Text('2:32 pm.'),
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
