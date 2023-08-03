abstract class SingleUseCase<Result>{
  Future<Result> call();
}