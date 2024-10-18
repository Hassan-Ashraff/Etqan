import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen(
      {super.key, required this.videoUrl, required this.videoName});
  final String videoUrl;
  final String videoName;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController _controller;
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          forceHD: true,
        ),
      );
    }

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _commentController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation != Orientation.portrait;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 10.sw,
        height: 10.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isPortrait
                ? SizedBox(
                    width: 10.sw,
                    height: 10.sh,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      bottomActions: const [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                            playedColor: Color(0xffC246BE),
                            handleColor: Color(0xffC246BE),
                          ),
                        ),
                        PlaybackSpeedButton(),
                        FullScreenButton(color: Color(0xffC246BE)),
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          bottomActions: const [
                            CurrentPosition(),
                            ProgressBar(
                              isExpanded: true,
                              colors: ProgressBarColors(
                                playedColor: Color(0xffC246BE),
                                handleColor: Color(0xffC246BE),
                              ),
                            ),
                            PlaybackSpeedButton(),
                            FullScreenButton(color: Color(0xffC246BE)),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.videoName,
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(
                          width: 10.sw,
                          height: 50.h,
                          child: TabBar(
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'الاختبارات الخاصة بي'),
                              Tab(text: 'التعليقات'),
                            ],
                            dividerColor: Colors.white,
                            indicatorColor: const Color(0xffC246BE),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 250.w,
                                        child: const Image(
                                            image: AssetImage(
                                                'assets/Images/Exams-bro.png')),
                                      ),
                                      Text('عذراً .. لا يوجد اختبارات لديك ..!',
                                          style: TextStyle(fontSize: 15.sp)),
                                      SizedBox(height: 5.h),
                                      Text('فقط سيظهر هنا الاختبارات الخاصة بك',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ),
                              // Comments Tab
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: TextField(
                                      controller: _commentController,
                                      decoration: InputDecoration(
                                        hintText: 'أضف تعليق...',
                                        suffixIcon: IconButton(
                                          icon: const Icon(Icons.send,
                                              color: Color(0xffC246BE)),
                                          onPressed: () {
                                            setState(() {
                                              if (_commentController
                                                  .text.isNotEmpty) {
                                                _comments.add(
                                                    _commentController.text);
                                                _commentController.clear();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: _comments.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: const Icon(Icons.comment,
                                              color: Color(0xffC246BE)),
                                          title: Text(_comments[index]),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
