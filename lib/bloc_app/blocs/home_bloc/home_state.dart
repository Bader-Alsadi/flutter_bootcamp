abstract class HomeState{
  
}

class InitNumberState extends HomeState{

}

class UpdateNumber extends HomeState{ 
  late int value;
  UpdateNumber({required this.value});

}