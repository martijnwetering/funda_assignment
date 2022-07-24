import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:funda_assignment/src/app.dart';
import 'package:funda_assignment/src/presentation/detail_page.dart';
import 'package:funda_assignment/src/presentation/search_page.dart';
import 'package:funda_assignment/src/presentation/widgets/search_result_row.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'search_page_test.mocks.dart';

final _searchResponse = {
  'Paging': {
    'AantalPaginas': 86,
    'HuidigePagina': 1,
    'VolgendeUrl': '/~/koop/amsterdam/+10km/p2/',
    'VorigeUrl': null
  },
  'TotaalAantalObjecten': 1281,
  'Objects': [
    {
      'Id': '1',
      'GlobalId': 1,
      'Koopprijs': 230000,
      'AangebodenSindsTekst': 'vandaag',
      'Adres': 'Testadres 1',
      'AantalKamers': 4,
      'Foto': '',
      'FotoMedium': '',
      'FotoLarge': '',
      'FotoLargest': '',
      'Afstand': 20,
      'MakelaarId': 1,
      'MakelaarNaam': 'Test makelaar',
      'Perceeloppervlakte': 300,
      'Woonoppervlakte': 150,
      'Woonplaats': 'Amsterdam',
      'Postcode': '1234 AB',
      'Prijs': {
        'KoopAbbreviation': 'k.k.',
        'Koopprijs': 230000,
        'Huurprijs': 0,
      },
    },
  ],
};

final _objectDetailResponse = {
  'Id': 1,
  'VerkoopStatus': 'verkocht',
  'Adres': 'Testadres 1',
  'AantalKamers': 4,
  'HoofdFoto': '',
  'VolledigeOmschrijving': 'Dit is een test omschrijving.',
  'PerceelOppervlakte': 300,
  'WoonOppervlakte': 150,
  'Plaats': 'Amsterdam',
  'Postcode': '1234 AB',
  'Bouwjaar': '1985',
  'Prijs': {
    'KoopAbbreviation': 'k.k.',
    'Koopprijs': 230000,
    'Huurprijs': 0,
  },
};

const _baseUrl = 'http://partnerapi.funda.nl';
const _searchUrl =
    '$_baseUrl/feeds/Aanbod.svc/json/ac1b0b1572524640a0ecc54de453ea9f/';
const _objectDetailUrl =
    '$_baseUrl/feeds/Aanbod.svc/json/detail/ac1b0b1572524640a0ecc54de453ea9f/koop/1/';

@GenerateMocks([Dio])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'SearchPage',
    () {
      late MockDio mockDio;

      setUp(
        () {
          mockDio = MockDio();

          when(
            mockDio.get<Map<String, dynamic>>(
              _searchUrl,
              queryParameters: anyNamed('queryParameters'),
            ),
          ).thenAnswer(
            (_) async => Response<Map<String, dynamic>>(
              requestOptions: RequestOptions(path: ''),
              data: _searchResponse,
            ),
          );

          when(
            mockDio.get<Map<String, dynamic>>(
              _objectDetailUrl,
              queryParameters: anyNamed('queryParameters'),
            ),
          ).thenAnswer(
            (_) async => Response<Map<String, dynamic>>(
              requestOptions: RequestOptions(path: ''),
              data: _objectDetailResponse,
            ),
          );
        },
      );

      testWidgets(
        'should show search results after user fires search request',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () async {
              await tester.pumpWidget(
                FundaAssignmentApp(apiClient: mockDio),
              );
              await tester.pumpAndSettle();

              expect(find.byType(SearchPage), findsOneWidget);

              await tester.enterText(
                find.byKey(const ValueKey('search')),
                'Amsterdam',
              );
              await tester.tap(find.byIcon(Icons.search));
              await tester.pumpAndSettle();

              verify(
                mockDio.get<Map<String, dynamic>>(
                  _searchUrl,
                  queryParameters: {
                    'type': 'koop',
                    'zo': '/amsterdam/+10km/',
                  },
                ),
              ).called(1);

              expect(find.byType(SearchResultRow), findsOneWidget);
            },
          );
        },
      );

      testWidgets(
        'should show details of an object when a search result is pressed',
        (WidgetTester tester) async {
          await mockNetworkImagesFor(
            () async {
              await tester.pumpWidget(
                FundaAssignmentApp(apiClient: mockDio),
              );
              await tester.pumpAndSettle();
              await tester.enterText(
                find.byKey(const ValueKey('search')),
                'Amsterdam',
              );
              await tester.tap(find.byIcon(Icons.search));
              await tester.pumpAndSettle();

              await tester.tap(find.byType(SearchResultRow));
              await tester.pumpAndSettle();

              verify(
                mockDio.get<Map<String, dynamic>>(_objectDetailUrl),
              ).called(1);

              expect(find.byType(DetailPage), findsOneWidget);
            },
          );
        },
      );
    },
  );
}
