class AppRoutes {
  static const initialBaseRoute = "/";
  //Region onboarding
  static const onboardingModuleRoute = "/onboarding/";
  static const onboardingStepsInternalRoute = "/steps";
  static const onboardingStepsExternalRoute = "/onboarding/steps";

  //Region dashboard
  static const dashboardModuleRoute = "/dashboard/";
  static const collaboratorDetailsInternalRoute = "/details/:id";
  static String collaboratorDetailsExternalRoute(int id) =>
      "/dashboard/details/$id";
}
