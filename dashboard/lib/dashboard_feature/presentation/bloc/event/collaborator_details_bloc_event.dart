abstract class CollaboratorDetailsBlocEvent {
  const CollaboratorDetailsBlocEvent();
}

class GetCollaboratorBlocEvent extends CollaboratorDetailsBlocEvent {
  final int id;
  const GetCollaboratorBlocEvent({required this.id});
}
