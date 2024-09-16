import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/enums/social_media_type.dart';
import 'package:flugram/app/widgets/svg_icon_button.dart';
import 'package:flugram/features/login/logic/social_login_bloc.dart';
import 'package:flutter/material.dart';

class SocialMediaAuthentication extends StatelessWidget {
  const SocialMediaAuthentication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SvgIconButton(
        //   onPressed: () {
        //     context
        //         .read<SocialLoginBloc>()
        //         .add(const Fetch(SocialMediaType.apple));
        //   },
        //   height: 32,
        //   path: Assets.iconsApple,
        // ),
        // const SizedBox(width: 16),
        SvgIconButton(
          onPressed: () {
            context.read<SocialLoginBloc>().fetch(SocialMediaType.google);
          },
          height: 32,
          path: Assets.iconsGoogle,
        ),
      ],
    );
  }
}
