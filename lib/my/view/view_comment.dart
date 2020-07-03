import 'package:mymusic/my/entity/comments_entity.dart';

abstract class CommentView{
  void updateComments(CommentsEntity entity);
  void commentsSuccess();
}