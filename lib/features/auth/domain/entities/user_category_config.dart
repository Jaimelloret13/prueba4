class UserCategoryConfig {
  final String category;
  final int dailyLessons;
  final int targetAccuracy;
  final List<String> notifications;

  UserCategoryConfig({
    required this.category,
    required this.dailyLessons,
    required this.targetAccuracy,
    required this.notifications,
  });

  static UserCategoryConfig getConfig(String category) {
    switch (category) {
      case 'noob':
        return UserCategoryConfig(
          category: 'noob',
          dailyLessons: 1,
          targetAccuracy: 50,
          notifications: ['Bienvenido a tu primer día de programación!'],
        );
      case 'aprendiz':
        return UserCategoryConfig(
          category: 'aprendiz',
          dailyLessons: 2,
          targetAccuracy: 60,
          notifications: ['¡Sigue aprendiendo y mejorando!'],
        );
      case 'intermedio':
        return UserCategoryConfig(
          category: 'intermedio',
          dailyLessons: 3,
          targetAccuracy: 70,
          notifications: ['¡Estás haciendo un gran trabajo!'],
        );
      case 'avanzado':
        return UserCategoryConfig(
          category: 'avanzado',
          dailyLessons: 4,
          targetAccuracy: 80,
          notifications: ['¡Eres un programador avanzado!'],
        );
      case 'geek':
        return UserCategoryConfig(
          category: 'geek',
          dailyLessons: 5,
          targetAccuracy: 90,
          notifications: ['¡Eres un geek de la programación!'],
        );
      default:
        return UserCategoryConfig(
          category: 'noob',
          dailyLessons: 1,
          targetAccuracy: 50,
          notifications: ['Bienvenido a tu primer día de programación!'],
        );
    }
  }
}
