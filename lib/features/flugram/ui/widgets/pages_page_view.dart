import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/pages_bloc.dart';
import 'package:flugram/features/flugram/ui/widgets/flugram_pages_item.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

// class PagesPageView extends StatefulWidget {
//   const PagesPageView(this.flugramId, {super.key});

//   final String flugramId;

//   @override
//   _PagesPageViewState createState() => _PagesPageViewState();
// }

// class _PagesPageViewState extends State<PagesPageView> {
//   late PageController _pageController;
//   final List<PageModel> _pages = [];

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   void _onGoPressed(PageModel pageModel) {
//     setState(() {
//       _pages.add(pageModel);
//       _pageController.animateToPage(
//         _pages.length,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   void _onPopPressed() {
//     setState(() {
//       if (_pages.isNotEmpty) {
//         _pages.removeLast();
//         _pageController.animateToPage(
//           _pages.length,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       itemCount: _pages.length + 1,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         // final pages = index == 0 ? widget.app.pages : [_pages[index - 1]];
//         return FlugramPagesItem(
//           // pages: pages,
//           pages: const [],
//           onGoPressed: _onGoPressed,
//           onPopPressed: _onPopPressed,
//           canPop: index > 0,
//           isInitialPage: index == 0,
//           flugramId: widget.app,
//         );
//       },
//     );
//   }
// }

class PagesPageView extends StatefulWidget {
  const PagesPageView(
    this.flugramId, {
    super.key,
  });

  final String flugramId;

  @override
  State<PagesPageView> createState() => _PagesPageViewState();
}

class _PagesPageViewState extends State<PagesPageView> {
  late PageController _pageController;
  final List<PageModel> _pages = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onGoPressed(PageModel pageModel) {
    setState(() {
      _pages.add(pageModel);
      _pageController.animateToPage(
        _pages.length,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPopPressed() {
    setState(() {
      if (_pages.isNotEmpty) {
        _pages.removeLast();
        _pageController.animateToPage(
          _pages.length,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BloweError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        if (state is BloweCompleted<List<PageModel>>) {
          return PageView.builder(
            controller: _pageController,
            itemCount: _pages.length + 1,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final pages = index == 0 ? state.data : [_pages[index - 1]];
              return FlugramPagesItem(
                pages: pages,
                onGoPressed: _onGoPressed,
                onPopPressed: _onPopPressed,
                canPop: index > 0,
                isInitialPage: index == 0,
                flugramId: widget.flugramId,
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
