open -a Simulator
mkdir -p test-results
flutter devices
flutter test integration_test/onboarding_test.dart --machine > test-results/integration-ios.json
zip -r test_results.zip test-results/