import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/utilities/colors.dart';
import 'package:wallpaper/utilities/constants.dart';
import 'package:wallpaper/viewmodel/home_view_model.dart';
import 'package:wallpaper/widget/tab_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back_ios, color: homeIconColor),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.1,
              color: Colors.white,
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: CachedNetworkImage(
                  imageUrl: 'https://i.pinimg.com/originals/07/33/ba/0733ba760b29378474dea0fdbcb97107.png',
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Lottie.asset('asset/lottie/loader.json');
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: homeFollowButtonBackgroundColor,
              ),
              onPressed: () {},
              child: const Text(
                'Follow',
                style: TextStyle(
                    color: homeFollowButtonTextColor, fontSize: homeSmallTitle),
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 5),
                  elevatedButtons(
                      title: 'Activity',
                      index: 0,
                      selectedIndex: value.selectedIndex,
                      context: context),
                  elevatedButtons(
                      title: 'Community',
                      index: 1,
                      selectedIndex: value.selectedIndex,
                      context: context),
                  elevatedButtons(
                      title: 'Shop',
                      index: 2,
                      selectedIndex: value.selectedIndex,
                      context: context),
                  const SizedBox(width: 5),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: value.selectedIndex ==2? Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height* 0.02),
                      const Text('All products',
                          style: TextStyle(
                              fontSize: homeMediumTitle,
                              fontWeight: FontWeight.bold)),
                              SizedBox(height: MediaQuery.of(context).size.height* 0.02),
                      FutureBuilder(
                          future: value.fetchImage(context),
                          builder: (context, snapshot) {
                            if (value.homeStatus == HomeStatus.loading) {
                              return Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height /3),
                                child: const CircularProgressIndicator(),
                              );
                            } else if (value.homeStatus == HomeStatus.error) {
                              return Column(
                                children: [
                                  Lottie.asset('asset/lottie/error.json'),
                                  const Text('Please turn on network!',style: TextStyle(fontSize: homeLargeTitle,fontWeight: FontWeight.bold),),
                                ],
                              );
                            } else if (value.homeStatus == HomeStatus.loaded) {
                              return Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.72,
                                  child: MasonryGridView.builder(
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount: snapshot.data!.length,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    itemBuilder: (context, index) {
                                      final image = snapshot.data![index];
                                      return GestureDetector(
                                        onTap: (){
                                          value.download(image.urls.raw,context);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: image.urls.raw,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) {
                                                  return Lottie.asset(
                                                      'asset/lottie/loader.json');
                                                },
                                               
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              image.altDescription,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ));
                            }
                            print(value.homeStatus == HomeStatus.loaded);
                            print(value.homeStatus);
                            return const SizedBox();
                          })
                    ],
                  ):value.selectedIndex == 1?const Center(child: Text('Community',style: TextStyle(fontSize: homeLargeTitle,fontWeight: FontWeight.bold),)):
                  const Center(child: Text('Activity',style: TextStyle(fontSize: homeLargeTitle,fontWeight: FontWeight.bold)))
                  
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
