
abstract class BaseUseCase<Result,Input>{
  Future<Result> call(Input input);
}