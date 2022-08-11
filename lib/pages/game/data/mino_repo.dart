import 'package:tetris/core/domain_object/mino.dart';

//TODO :: if we need to request in backend mino repo need to have datasource
class MinoRepo {
  Mino moveMinoLeft({required Mino mino}) {
    return mino.moveMinoLeft();
  }
  Mino moveMinoRight({required Mino mino}) {
    return mino.moveMinoRight();
  }

  Mino moveMinoDown({required Mino mino}) {
    return mino.moveMinoDown();
  }

  Mino changeMinoLocationWhenRotateChange({required Mino mino}) {
    return mino.changeMinoLocationWhenRotateChange();
  }
}