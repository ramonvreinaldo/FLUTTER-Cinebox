// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_rest_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(tmdbRestClient)
const tmdbRestClientProvider = TmdbRestClientProvider._();

final class TmdbRestClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const TmdbRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbRestClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return tmdbRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$tmdbRestClientHash() => r'25e8cde3ca30dd407d2fea9694008b615e71d197';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
