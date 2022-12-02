import 'package:insta_clone_hit/views/animations/lottie_animation_view.dart';
import 'package:insta_clone_hit/views/animations/models/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
