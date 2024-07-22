import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../widgets/w_home_banner.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends PageStateful<BannerScreen, HomeBloc> {
  int bannerIndex = 1;
  @override
  Widget buildPage(BuildContext context, HomeBloc bloc) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.listBanner != current.listBanner,
      builder: (context, state) {
        if (state.listBanner == null) {
          return SizedBox(
              width: double.infinity,
              height: AppSize.bannerHeight,
              child: const AppCircularLoading());
        }
        if (state.listBanner!.isEmpty) {
          return Center(
            child: Container(
                padding: EdgeInsets.all(AppSize.space22),
                child: const Text("No Banner")),
          );
        }
        return Stack(
          children: [
            CarouselSlider.builder(
              itemCount: state.listBanner!.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return WBanner(banner: state.listBanner![index], fit: BoxFit.fill,);
              },
              options: CarouselOptions(
                // height: 202.h,
                viewportFraction: 1,
                autoPlayCurve: Curves.linear,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                autoPlay: state.listBanner!.length > 1 ? true : false,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
                clipBehavior: Clip.none,
                onPageChanged: (index, reason) {
                  setState(() {
                    bannerIndex = index + 1;
                  });
                },
              ),
            ),
            Positioned(
              right: AppSize.paddingWithScreen,
              bottom: AppSize.paddingWithScreen,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppSize.spaceBetweenWidgetSmall,
                    horizontal: AppSize.spaceBetweenWidgetMedium),
                decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(.5),
                    borderRadius: BorderRadius.all(Radius.circular(100.r))),
                child: Text(
                  "$bannerIndex/${state.listBanner!.length}",
                  style: AppStyles.text12.copyWith(color: AppColors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
