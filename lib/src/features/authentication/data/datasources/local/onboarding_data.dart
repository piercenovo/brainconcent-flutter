class OnBoarding {
  final String title;
  final String subtitle;
  final String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: '¡Bienvenido a\n Brainconcent!',
    subtitle:
        'Antes de comenzar, queremos explicarte\n todo lo que puedes hacer\n con nuestra aplicación.',
    image: 'assets/images/onboarding/onboarding_1.png',
  ),
  OnBoarding(
    title: '',
    subtitle:
        'Brainconcent a un sistema de aprendizaje\n y evaluación de la concentración\n otorgando resultados de mejoría\n en tus áreas cognitivas.',
    image: 'assets/images/onboarding/onboarding_2.png',
  ),
  OnBoarding(
    title: '',
    subtitle:
        'Medimos con precisión 5 habilidades\n cognitivas. Iremos mostrando\n tu evolución durante tus entrenamientos\n mediante gráficas de puntaje.',
    image: 'assets/images/onboarding/onboarding_3.png',
  ),
  OnBoarding(
    title: '',
    subtitle:
        'Disfruta de una variedad de juegos\n para entrenar tus áreas\n cognitivas, a darle con todo!',
    image: 'assets/images/onboarding/onboarding_4.png',
  ),
];
